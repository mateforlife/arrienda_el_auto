require 'test_helper'

class ReservationsMailerTest < ActionMailer::TestCase
  test "created_for_owner" do
    mail = ReservationsMailer.created_for_owner
    assert_equal "Created for owner", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "created_for_driver" do
    mail = ReservationsMailer.created_for_driver
    assert_equal "Created for driver", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
