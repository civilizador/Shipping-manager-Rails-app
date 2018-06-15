class Schedule < ApplicationRecord
  belongs_to :job
  belongs_to :boat
end
