RSpec::Matchers.define :be_removable do
  match do |server|
    Timeout.timeout(TIMEOUT){
      begin
        Net::FTP.open(server) do |ftp|
          ftp.passive = @passive
          ftp.login(@user, @pass)
          ftp.puttextcontent('rspec test', 'rspec_test.txt')
          ftp.delete('rspec_test.txt')
          ret = ftp.ls('/').find {|f| f.include?('rspec_test.txt')}
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