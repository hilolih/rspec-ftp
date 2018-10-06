class Net::FTP
  def puttextcontent(content, remotefile, &block)
    f = StringIO.new(content)
    begin
      storlines('STOR ' + remotefile, f, &block)
    ensure
      f.close
    end
  end
end