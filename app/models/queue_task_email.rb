# == Schema Information
#
# Table name: queue_task_emails
#
#  id                :integer          not null, primary key
#  email             :string
#  queue_task_emails :string
#  subscriber_id     :integer
#  course_id         :integer
#  post_id           :integer
#  sent              :boolean
#  opened            :boolean
#  bounced           :boolean
#  day_to_send       :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  opened_date       :datetime
#

class QueueTaskEmail < ApplicationRecord
  belongs_to :subscriber
  belongs_to :course
  belongs_to :post
end
