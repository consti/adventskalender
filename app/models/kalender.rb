class Kalender < ActiveRecord::Base
  validates :prize, :number, presence: true
  belongs_to :prize

  delegate :sponsor, :day, to: :prize
end
