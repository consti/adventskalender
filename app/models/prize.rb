class Prize < ActiveRecord::Base
  validates :sponsor, :day, :name, presence: true

  belongs_to :sponsor
  belongs_to :day

  has_many :kalenders

  def display_name
    [
      day.try(:name),
      sponsor.try(:name),
      name
    ].compact.join(' - ')
  end
end
