# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def manage?
    internal_users
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
