require 'spec_helper'

describe Elliot::Repository do
  subject do
    FakeRepository
  end

  describe '.authenticate' do
    let!(:fake) do
      _fake = FakeEntity.new(email: 'foo@bar.com')
      _fake.password = 'foobar'

      _fake = FakeRepository.create(_fake)

      _fake
    end

    it 'returns the correct fake when given the correct attributes' do
      expect(subject.authenticate('foo@bar.com', 'foobar')).to eq fake
    end

    it 'returns nil with incorrect email' do
      expect(subject.authenticate('bar@foo.com', 'foobar')).to be_nil
    end

    it 'returns nil with incorrect password' do
      expect(subject.authenticate('foo@bar.com', 'barfoo')).to be_nil
    end
  end
end
