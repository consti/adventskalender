require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "sponsor_information" do
    mail = Notifications.sponsor_information
    assert_equal "Sponsor information", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
