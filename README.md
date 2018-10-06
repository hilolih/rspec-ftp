# Rspec::Ftp

Test FTP Protocol with Rspec.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-ftp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-ftp

## Usage

~~~ruby
it "enable to login" do
   expect("server.com").to be_accessible.user("username").pass("password")
end

it "enable to login on active mode" do
   expect("server.com").to be_accessible.user("username").pass("password").active
end

it "enable to login on passive mode" do
   expect("server.com").to be_accessible.user("username").pass("password").passive
end

it 'check chroot enabled' do
  expect('server.com').to be_chroot.user('ftpuser').pass('supersecret')
end

it 'check writable with active mode' do
  expect('server.com').to be_writable.user('ftpuser').pass('supersecret').active
end

it 'check writable with passive mode' do
  expect('server.com').to be_writable.user('ftpuser').pass('supersecret').passive
end

# If no value is specified for `test_filename`, a file with automatically generated file name will be created.
it 'check writable with passive mode and use original test file' do
  expect('server.com').to be_writable.user('ftpuser').pass('supersecret').passive.test_filename('foobar')
end

it 'check removable' do
  expect('server.com').to be_removable.user('ftpuser').pass('supersecret')
end

# If no value is specified for `test_filename`, a file with automatically generated file name will be created.
it 'check removable and use original test file' do
  expect('server.com').to be_removable.user('ftpuser').pass('supersecret').test_filename('foobar')
end
~~~

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rspec-ftp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
