class User < ApplicationRecord
    has_secure_password
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

    validate:username_validation


    def username_validation
        if name && !username
            errors.add("Please enter a username!")
        end
    end
end
