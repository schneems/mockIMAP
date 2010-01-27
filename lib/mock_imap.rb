module MockIMAP 
  # TEMPLATES_PATH = File.dirname(__FILE__) + '/templates' 
  # CHARSET = "utf-8" 
  
  def getMockEmails(receiveHash = { })
       if !receiveHash[:location].nil?
          db = SQLite3::Database.open(receiveHash[:location].to_s )
        else
          user = `whoami` ## will 'return richardschneeman\n', need to chomp out the \n
          db = SQLite3::Database.open( "/Users/#{user.chomp}/Documents/MockSMTP/default.data" )
        end
        emails = db.execute( "select ZTRANSFERDATA from ZMESSAGE" )
    #    lastEmailIndex = emails.count - 1 ## zero indexed so we minus one
    #    lastEmail = emails[lastEmailIndex].to_s
        emails.collect! {|x| x.to_s}
      return emails
  end
    
 # def mockReceive(receiveHash = { })
 #   lastEmail = getMockEmails(receiveHash).last
 #   receiveHash[:mailer].constantize.receive(lastEmail)          
 # end

end 
