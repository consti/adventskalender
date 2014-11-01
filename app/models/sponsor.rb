class Sponsor < ActiveRecord::Base
  validates :name, :address, :city, :phone, presence: true

  mount_uploader :logo, LogoUploader
  has_many :prizes
end
