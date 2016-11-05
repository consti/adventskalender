class Sponsor < ActiveRecord::Base
  validates :name, :address, :city, :phone, :year, presence: true

  mount_uploader :logo, LogoUploader
  has_many :prizes, dependent: :destroy

  def copy_logo!
    old_sponsor = Sponsor.
                  where.not(year: year, logo: nil).
                  where('name LIKE ?', '%' + name + '%').
                  first
    return unless old_sponsor
    self.remote_logo_url = old_sponsor.logo.url
    save
  end
end
