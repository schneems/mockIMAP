
class MockMailer < ActionMailer::Base
  def test
    @recipients   = "test@example.com"
    @from         = "foo@example.com" 
    headers         "Reply-to" => "foo@example.com"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    @content_type = "text/html"
    body[:message]=  "Hello World"
  end  
end