RSpec::Matchers.define :be_removable do
  match do |server|
    t = TestFile.new(@test_filename)
    dummy_string = t.contents
    dummy_filename = t.name

    Timeout.timeout(TIMEOUT){
      begin
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

  chain :test_filename do |test_filename|
    @test_filename = test_filename
  end

  chain :active do
    @passive = false
  end

  chain :passive do
    @passive = true
  end
end