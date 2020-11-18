class BeachPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end
end
