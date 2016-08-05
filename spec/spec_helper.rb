$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'elliot'

require 'hanami'
require 'hanami/model'

RSpec.configure do |config|
end

class FakeEntity
  include Hanami::Entity
  include Elliot::Entity
end

class FakeRepository
  include Hanami::Repository
  include Elliot::Repository
end

Hanami::Model.configure do
  adapter type: :memory, uri: 'memory://localhost/elliot_test'

  mapping do
    collection :fakes do
      entity FakeEntity
      repository FakeRepository

      attribute :id, Integer
      attribute :email, String
      attribute :password_digest, String
    end
  end
end.load!
