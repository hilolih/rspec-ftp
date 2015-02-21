require "spec_helper"

describe "#accessible" do

  before do
    @ftp = double("FTP", :passive => nil )
    allow(Net::FTP).to receive(:new) { @ftp }
  end

  it "can login valid user and password" do
    allow(@ftp).to receive(:login) {|ftp| true }
    expect('example.com').to be_accessible.user('user').pass('pass')
  end

  it "login failed" do
    allow(@ftp).to receive(:login).and_return( false )
    expect('example.com').not_to be_accessible.user('hoge').pass('hoge')
  end

  it "raise error to not be accessible" do
    allow(@ftp).to receive(:login).and_raise( "err" )
    expect('example.com').not_to be_accessible.user('hoge').pass('hoge')
  end

  it "activemode" do
    allow(@ftp).to receive(:login) {|ftp| true }
    expect('example.com').to be_accessible.user('user').pass('pass').active
  end

  it "passivemode" do
    allow(@ftp).to receive(:login) {|ftp| true }
    expect('example.com').to be_accessible.user('user').pass('pass').passive
  end
end
