require 'spec_helper'
require 'pry'

describe Elliot::Entity do
  before do
    class FakeEntity
      include Hanami::Entity
      include Elliot::Entity
    end
  end

  subject do
    f = FakeEntity.new
    f.password = 'foobar'
    f
  end

  it 'has a password_digest attribute' do
    expect(subject).to respond_to :password_digest
  end

  describe '#password' do
    it 'returns a BCrypt::Password object' do
      expect(subject.password).to be_a BCrypt::Password
    end
  end

  describe '#password=' do
    it 'sets the password_digest' do
      expect(subject.password_digest).to_not be_nil
    end
  end

  describe '#password?' do
    it 'checks the password' do
      expect(subject.password?('foobar')).to be_truthy
    end
  end
end
