class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  has_many :prizes
  has_many :kalenders, through: :prizes
  has_many :sponsors,  through: :prizes

  scope :year, ->(year) {
    where('EXTRACT(YEAR FROM days.date) = :year', year: year)
  }

  scope :opened, -> {
    if ENV['ALL_DOORS_OPEN'] && ENV['ALL_DOORS_OPEN'] == 'true'
      where(nil)
    else
      where('date <= ?', Time.now.in_time_zone('Berlin').to_date)
    end
  }
  attr_accessor :width, :height, :image, :position

  def name
    date.to_s
  end

  def self.create_for_year(year)
    start_date = Date.parse("01.12.#{year}")
    end_date   = Date.parse("24.12.#{year}")
    (start_date..end_date).each do |date|
      Day.where(date: date).first_or_create
    end
  end

  def year
    date.year
  end
end
