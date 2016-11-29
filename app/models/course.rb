# == Schema Information
#
# Table name: courses
#
#  id              :integer          not null, primary key
#  name            :string
#  tagline         :string
#  description     :text
#  admin_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  course_image_id :string
#

class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  attachment :course_image, type: :image

  belongs_to :admin
  has_many :posts, dependent: :destroy
  has_many :course_subscribers
  has_many :subscribers, through: :course_subscribers

  def should_generate_new_friendly_id?
    name_changed?
  end
end
