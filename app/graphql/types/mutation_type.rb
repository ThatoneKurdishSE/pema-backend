module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :add_user, mutation: Mutations::AddUser
  end
end
