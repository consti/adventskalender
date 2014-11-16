class Prize < ActiveRecord::Base
  validates :sponsor, :day, :name, presence: true

  belongs_to :sponsor
  belongs_to :day

  has_many :kalenders

  accepts_nested_attributes_for :kalenders

  def display_name
    [
      day.try(:name),
      sponsor.try(:name),
      name
    ].compact.join(' - ')
  end

  def anzahl
    super || 1
  end
end
