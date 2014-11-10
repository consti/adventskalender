class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  has_many :prizes
  has_many :kalenders, through: :prizes
  has_many :sponsors,  through: :prizes

  scope :opened, -> { where('date <= ?', Date.parse('15.12.2014')) }
  attr_accessor :width, :height, :image

  def name
    date.to_s
  end
end
