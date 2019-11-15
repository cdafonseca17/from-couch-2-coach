class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    @courses = policy_scope(Course).order(created_at: :desc)
  end

  def show?
    return true
  end

  def create?
    user.user_type == "Trainer"
  end

  def list_trainer_courses?
    user.user_type == "Trainer"
  end

  def update?
    # record.user = user
    user.user_type == "Trainer" && record.user == user
    # - record: the course passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    # record.user == user
    user.user_type == "Trainer"
    # record.user == user
  end

  def filter_courses
    return true
  end
end
