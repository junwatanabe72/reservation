require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "agreed" do
    mail = NoticeMailer.agreed
    assert_equal "Agreed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
