# == Schema Information
#
# Table name: course_subscribers
#
#  id            :integer          not null, primary key
#  subscriber_id :integer
#  course_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CourseSubscriber < ApplicationRecord
  belongs_to :subscriber
  belongs_to :course
end
