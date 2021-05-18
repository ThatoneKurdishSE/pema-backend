class User < ApplicationRecord
    has_secure_password

    # Will be installing the client_side_validation gem for the future.

    # Email validation that requires users to register with a real email address
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

    validate:username_validation

    
    # Method that validates, if name is present, username is required. however both are optional(together)!
    def username_validation
        if name && !username
            errors.add("Please enter a username!")
        end
    end
end