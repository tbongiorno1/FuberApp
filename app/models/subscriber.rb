# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscriber < ApplicationRecord
  validates :email, uniqueness: true
  has_many :course_subscribers, dependent: :destroy
  has_many :courses, through: :course_subscribers
  has_many :messages, class_name: "Ahoy::Message"
end
