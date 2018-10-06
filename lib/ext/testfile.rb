class TestFile
  def initialize(test_filename)
    @test_filename = test_filename
    @dummy_string = SecureRandom.hex(32)
  end

  def name
    if @test_filename.nil?
      'rspec-ftp_' + @dummy_string + '.txt'
    else
      'rspec-ftp_' + @test_filename + '.txt'
    end
  end

  def contents
    if @test_filename.nil?
      @dummy_string
    else
      Digest::MD5.hexdigest(@test_filename)
    end
  end
end