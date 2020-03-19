# frozen_string_literal: true

# User Controller
class UsersController < ApplicationController
  before_action :check_my_login

  def check_my_login
    redirect_to new_user_session_path if user_signed_in?
  end
end
