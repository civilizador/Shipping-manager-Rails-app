class Boat < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :jobs, :through => :schedules
  validates :name, uniqueness: {message: "This Boat name is already being used"}
  has_attached_file :image, styles: {large: '400x400', medium: '200x200', thumb: '100x100#'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
