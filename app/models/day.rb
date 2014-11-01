class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  has_many :prizes
  has_many :kalenders, through: :prizes
  has_many :sponsors,  through: :prizes

  def name
    date.to_s
  end
end
