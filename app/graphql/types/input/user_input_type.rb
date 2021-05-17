module Types
    module Input
        class UserInputType < Types::BaseInputObject
            argument :username, String, required: true
            argument :password, String, required: false
            argument :email, String, required: true
            argument :name, String, required: false
        end
    end
end