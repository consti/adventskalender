class Prize < ActiveRecord::Base
  validates :sponsor, :day, :name, presence: true

  belongs_to :sponsor
  belongs_to :day

  has_many :kalenders

  scope :year, ->(year) {
    joins(:day).
      where('EXTRACT(YEAR FROM days.date) = :year', year: year)
  }


  accepts_nested_attributes_for :kalenders

  delegate :year, to: :day

  def display_name
    [
      day.try(:name),
      sponsor.try(:name),
      name
    ].compact.join(' - ')
  end
end
