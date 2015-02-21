# coding: utf-8
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rspec-ftp"
  spec.version       = "0.0.1"
  spec.authors       = ["hiroshi shimoda"]
  spec.email         = ["hilolih@gmail.com"]
  spec.summary       = %q{Test FTP Protocol with Rspec}
  spec.description   = %q{Test FTP Protocol with Rspec}
  spec.homepage      = "https://github.com/hilolih/rspec-ftp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "pry-byebug"
  spec.add_dependency "rspec", '>= 2.9'
  spec.add_dependency "rspec-mocks"
  spec.add_dependency "timeout"
end
