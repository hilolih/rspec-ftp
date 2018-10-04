RSpec::Matchers.define :be_writable do
  match do |server|
    Timeout.timeout(TIMEOUT){
      begin
        Net::FTP.open(server) do |ftp|
          ftp.passive = @passive
          ftp.login(@user, @pass)
          ftp.puttextcontent("rspec test", "rspec_test.txt")
          filedata = ""
          ftp.retrlines("RETR " + "rspec_test.txt") do |block|
            filedata << block
          end
          filedata == "rspec test" ? true : false
        end
      rescue
        false
      end
    }
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