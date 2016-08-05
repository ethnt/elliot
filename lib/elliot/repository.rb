module Elliot

  # A module for including in repositories. Adds a finder that authenticates
  # users.
  module Repository
    def self.included(base)
      base.class_eval do
        def self.authenticate(email, password)
          record = query { where(email: email) }.first

          return nil unless record
          return record if record.password?(password)

          nil
        end
      end
    end
  end
end
