class CourseMailer < ApplicationMailer
  def send_post post_id, subscriber_id
    begin
      @post = Post.find(post_id)
      @subscriber = Subscriber.find(subscriber_id)
      track admin: @subscriber
      track open: true
      mail(from: "hello@fuberapp.com", to: @subscriber.email, subject: @post.course.name)
    rescue Exception => e
      p "ERROR => #{e.message}"
    end
  end
end
