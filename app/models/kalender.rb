class Kalender < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :prize

  scope :year, ->(year) {
    joins(prize: :day).
      where('EXTRACT(YEAR FROM days.date) = :year', year: year)
  }

  delegate :sponsor, :day, :year, to: :prize
end
