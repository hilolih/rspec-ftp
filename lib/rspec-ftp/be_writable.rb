RSpec::Matchers.define :be_writable do
  match do |server|
    Timeout.timeout(TIMEOUT){
      begin
        dummy_string = SecureRandom.hex(32)
        dummy_filename = 'rspec-ftp_' + dummy_string + '.txt'
        Net::FTP.open(server) do |ftp|
          ftp.passive = @passive
          ftp.login(@user, @pass)
          ftp.puttextcontent(dummy_string, dummy_filename)
          filedata = ''
          ftp.retrlines('RETR ' + dummy_filename) do |block|
            filedata << block
          end
          filedata == dummy_string ? true : false
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