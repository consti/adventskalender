class Notifications < ApplicationMailer
  def sponsor_information(sponsor, prizes)
    mail subject: 'Test', to: sponsor.email
  end
end
