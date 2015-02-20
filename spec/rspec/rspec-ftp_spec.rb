require "spec_helper"

describe "rspec-ftp" do
  before do
    @ftp = double("FTP")
    allow(Net::FTP).to receive(:new) do
      @ftp
    end
  end

  it "can login valid user and password" do
    allow(@ftp).to receive(:login).and_return( true )
    expect('example.com').to be_accessible.user('user').pass('pass')
  end

  it "login failed" do
    allow(@ftp).to receive(:login).and_return( false )
    expect('example.com').not_to be_accessible.user('hoge').pass('hoge')
  end

end
