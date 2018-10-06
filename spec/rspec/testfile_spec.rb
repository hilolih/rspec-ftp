require 'spec_helper'

describe 'TestFile#name' do
  before do
    allow(SecureRandom).to receive(:hex).with(32).and_return('5b55729c28f37e01cdb8173e8d4619dd743203d2e68a0e946e8c6ffd1a76e07c')
  end

  it 'When a value is specified for test_filename' do
    t = TestFile.new('foobar')
    expect(t.name).to eq('rspec-ftp_foobar.txt')
  end

  it 'When no value is specified for test_filename' do
    t = TestFile.new(nil)
    expect(t.name).to eq('rspec-ftp_5b55729c28f37e01cdb8173e8d4619dd743203d2e68a0e946e8c6ffd1a76e07c.txt')
  end
end

describe 'TestFile#contents' do
  before do
    allow(SecureRandom).to receive(:hex).with(32).and_return('5b55729c28f37e01cdb8173e8d4619dd743203d2e68a0e946e8c6ffd1a76e07c')
  end

  it 'When a value is specified for test_filename' do
    t = TestFile.new('foobar')
    expect(t.contents).to eq('3858f62230ac3c915f300c664312c63f')
  end

  it 'When no value is specified for test_filename' do
    t = TestFile.new(nil)
    expect(t.contents).to eq('5b55729c28f37e01cdb8173e8d4619dd743203d2e68a0e946e8c6ffd1a76e07c')
  end
end