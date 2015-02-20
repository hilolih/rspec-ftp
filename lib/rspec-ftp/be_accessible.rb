RSpec::Matchers.define :be_accessible do
  match do |server|
    begin
      @ftp = Net::FTP.new
      @ftp.login( server, @user, @pass )
    rescue
      false
    end
  end
  
  chain :user do |user|
    @user = user
  end

  chain :pass do |pass|
    @pass = pass
  end

end

