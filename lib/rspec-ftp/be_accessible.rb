RSpec::Matchers.define :be_accessible do
  match do |server|
    begin
      Timeout.timeout(TIMEOUT){
        @ftp = Net::FTP.new(server)
        @passive ||= false
        @ftp.login(@user, @pass) do |ftp|
          ftp.pwd
        end
      }
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

  chain :active do
    @passive = false
  end

  chain :passive do
    @passive = true
  end

end