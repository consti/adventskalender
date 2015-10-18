class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  has_many :prizes
  has_many :kalenders, through: :prizes
  has_many :sponsors,  through: :prizes

  scope :year, ->(year) {
    where('EXTRACT(YEAR FROM days.date) = :year', year: year)
  }

  scope :opened, -> {
    where('date <= ?', Time.now.in_time_zone('Berlin').to_date)
  }
  attr_accessor :width, :height, :image, :position

  def name
    date.to_s
  end
end
