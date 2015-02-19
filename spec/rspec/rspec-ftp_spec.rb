require "spec_helper"

def stub_ftp
  allow(Net::FTP).to receive(:new) do
  end
end

describe "rspec-ftp" do
  it "can login valid user and password" do
    expect('example.com').to be_accessible.user('user').pass('pass')
  end
  it "login failed" do
    expect('example.com').not_to be_accessible.user('hoge').pass('hoge')
  end
end
