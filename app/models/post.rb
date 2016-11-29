# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string
#  content    :text
#  course_id  :integer
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  order      :integer          default(0)
#

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :course
  belongs_to :admin

  def should_generate_new_friendly_id?
    name_changed?
  end
end
