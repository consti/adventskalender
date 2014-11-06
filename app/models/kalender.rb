class Kalender < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :prize

  delegate :sponsor, :day, to: :prize
end
