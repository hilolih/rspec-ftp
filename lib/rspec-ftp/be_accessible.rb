RSpec::Matchers.define :be_accessible do
  match do |server|
    @ftp = Net::FTP.new
    @ftp.login( server, @user, @pass )
  end
  
  chain :user do |user|
    @user = user
  end

  chain :pass do |pass|
    @pass = pass
  end

end

