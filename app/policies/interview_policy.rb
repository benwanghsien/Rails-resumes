# frozen_string_literal: true

class InterviewPolicy < ApplicationPolicy
  def new?
    user
  end

  def create?
    internal_users || vendor
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
