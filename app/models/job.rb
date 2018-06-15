class Job < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :boats, :through => :schedules

  validates_numericality_of :cost, greater_than_or_equal_to: 100
  validates :description, length: { minimum: 20, too_long: "Your Dscription must be at least 20 Characters" }
end
