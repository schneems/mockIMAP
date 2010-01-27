#class MockMailer < ActionMailer::Base
#  def test
#    @recipients   = "test@example.com"
#    @from         = "foo@example.com" 
#    headers         "Reply-to" => "foo@example.com"
#    @subject      = "This is a subject line someone would send"
#    @sent_on      = Time.now
#    @content_type = "text/html"
#    body[:message]=  "Hello World"
#  end  
#end



require File.dirname(__FILE__) + '/spec_helper'  
  
describe "mockIMAP" do  
  
  
  it "should download the latest email" do
      puts "mockSMTP needs to be running for this to execute correctly"
      MockMailer.deliver_test
      mail = getMockEmails.last
       TMail::Mail.parse(mail).to.to_s.should ==  "test@example.com"
       TMail::Mail.parse(mail).from.to_s.should == "foo@example.com"
       TMail::Mail.parse(mail).subject.to_s.should == "This is a subject line someone would send"
       TMail::Mail.parse(mail).body.to_s.should == "Hello World"
  end
  

  
end