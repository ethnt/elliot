require 'bcrypt'

module Elliot

  # A module for including in entities. Provides password getters and setters.
  module Entity
    def self.included(base)
      base.class_eval do
        attributes :email, :password_digest

        def password
          BCrypt::Password.new(self.password_digest)
        end

        def password=(unencrypted)
          encrypted = BCrypt::Password.create(unencrypted)

          self.password_digest = encrypted
        end

        def password?(unencrypted)
          password == unencrypted
        end
      end
    end
  end
end
