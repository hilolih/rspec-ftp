RSpec::Matchers.define :be_writable do
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
          filedata = ''
          ftp.retrlines('RETR ' + dummy_filename) do |block|
            filedata << block
          end
          ftp.delete(dummy_filename)
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