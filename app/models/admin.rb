# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  name                   :string
#  lastname               :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  profile_image_id       :string
#

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :profile_image, type: :image

  has_many :courses, dependent: :destroy
  has_many :posts, through: :courses

  validates :email, uniqueness: true

  def full_name
    @full_name ||= "#{name} #{lastname}"
  end
end
