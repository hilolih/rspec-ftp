require 'spec_helper'

describe '#be_accessible' do
  before do
    @ftp = double('FTP', :passive => nil)
    allow(Net::FTP).to receive(:new) { @ftp }
  end

  it 'can login valid user and password' do
    allow(@ftp).to receive(:login) { |ftp| true }
    expect('example.com').to be_accessible.user('user').pass('pass')
  end

  it 'login failed' do
    allow(@ftp).to receive(:login).and_return(false)
    expect('example.com').not_to be_accessible.user('hoge').pass('hoge')
  end

  it 'raise error to not be accessible' do
    allow(@ftp).to receive(:login).and_raise('err')
    expect('example.com').not_to be_accessible.user('hoge').pass('hoge')
  end

  it 'activemode' do
    allow(@ftp).to receive(:login) { |ftp| true }
    expect('example.com').to be_accessible.user('user').pass('pass').active
  end

  it 'passivemode' do
    allow(@ftp).to receive(:login) { |ftp| true }
    expect('example.com').to be_accessible.user('user').pass('pass').passive
  end
end

describe '#be_accessible (real server)' do
  it 'can login valid user and password' do
    expect('vsftpd-server').to be_accessible.user('ftpuser').pass('supersecret')
  end
end

describe '#be_chroot (real server)' do
  it 'check chroot enabled' do
    expect('vsftpd-server').to be_chroot.user('ftpuser').pass('supersecret')
  end
end

describe '#be_writable (real server)' do
  it 'check writable with active mode' do
    expect('vsftpd-server').to be_writable.user('ftpuser').pass('supersecret').active
  end

  it 'check writable with passive mode' do
    expect('vsftpd-server').to be_writable.user('ftpuser').pass('supersecret').passive
  end

  it 'check writable with passive mode and use original test file' do
    expect('vsftpd-server').to be_writable.user('ftpuser').pass('supersecret').\
                               passive.\
                               test_filename('foobar')
  end
end 

describe '#be_removable (real server)' do
  it 'check removable' do
    expect('vsftpd-server').to be_removable.user('ftpuser').pass('supersecret')
  end

  it 'check removable with passive mode and use original test file' do
    expect('vsftpd-server').to be_removable.user('ftpuser').pass('supersecret').\
                               test_filename('foobar')
  end
end
