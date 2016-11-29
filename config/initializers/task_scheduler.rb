scheduler = Rufus::Scheduler.new
# Production Schedule Every Monday at 10:00 AM
# scheduler.cron('00 10 * * 1') do
scheduler.every('1m') do
  p Time.now
  p "Running Scheduler"

  today = Time.new
  tasks = QueueTaskEmail.where(day_to_send: today.beginning_of_day..today.end_of_day, sent: false).includes(:post, :subscriber)

  tasks.each do |task|
    CourseMailer.send_post(task.post.id, task.subscriber.id).deliver_now
    task.update_attribute(:sent, true)
  end
end
