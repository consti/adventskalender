# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications/sponsor_information
  def sponsor_information
    Notifications.sponsor_information
  end

end
