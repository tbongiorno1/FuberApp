class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        next_day = Time.now
        course = Course.find(params[:course_id])
        subscriber = Subscriber.find_or_create_by(email: subscriber_params[:email])
        unless CourseSubscriber.where("course_id = ? and subscriber_id = ? ", course.id, subscriber.id).any?
          course_subscribers = course.course_subscribers.create(subscriber_id: subscriber.id)
          course.posts.sort { |a, b| a.order <=> b.order }
          course.posts.each_with_index do |post, index|
            task = QueueTaskEmail.new
            task.subscriber = subscriber
            task.course = course
            task.post = post
            task.day_to_send = next_day
            task.sent = false
            task.opened = false
            task.bounced = false
            # Alternates every day that posts have to be sent between monday (starting monday) and thursday.
            # 2n = monday | 2n + 1 = thursday
            if (index % 2 == 0)
              next_day += 3.days
            else
              next_day += 4.days
            end
            task.save
          end
        end
      end
      redirect_to course_path(params[:course_id]) + "#subscribe", flash: { success: "You're now subscribed." }
    rescue Exception => e
      p e.message
      redirect_to course_path(params[:course_id]) + "#subscribe", flash: { warning: "There was an error processing the request." }
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
