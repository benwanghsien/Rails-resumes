# frozen_string_literal: true

module Admin
  class UsersController < Admin::BaseController
    def index
      @users = User.students
    end
  end
end
