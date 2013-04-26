require 'test_helper'

class SignupNotifierTest < ActionMailer::TestCase
  test "signedup" do
    mail = SignupNotifier.signedup
    assert_equal "Signedup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
