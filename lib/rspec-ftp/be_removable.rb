RSpec::Matchers.define :be_removable do
  match do |server|
    Timeout.timeout(TIMEOUT){
      begin
        dummy_string = SecureRandom.hex(32)
        dummy_filename = 'rspec-ftp_' + dummy_string + '.txt'
        Net::FTP.open(server) do |ftp|
          ftp.passive = @passive
          ftp.login(@user, @pass)
          ftp.puttextcontent(dummy_string, dummy_filename)
          ftp.delete(dummy_filename)
          ret = ftp.ls('/').find {|f| f.include?(dummy_filename)}
          ret.nil? ? true : false
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