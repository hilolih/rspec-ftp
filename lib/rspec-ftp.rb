require 'net/ftp'
require 'securerandom'

require 'ext/ftp'
require 'rspec-ftp/be_accessible'
require 'rspec-ftp/be_chroot'
require 'rspec-ftp/be_writable'
require 'rspec-ftp/be_removable'

TIMEOUT = 3
