class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    # record.user = user
    return false
  end

  def destroy?
    # record.user == user
    return false
  end
end
