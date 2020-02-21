# frozen_string_literal: true

class AdminController < ApplicationController
  def index; end

  def show; end

  def new
    @user = User.new
    @usershow = User.all
  end

  def create
    puts '                   ------------------hii'
    # byebug
    @user = User.new(info_params)

    # byebug
    if @user.status.to_i == 2
      @user.email = @user.enrollment.to_s + '@vatsal.com'
      # byebug
    end

    # @user.email = "vatsal"+User.maximum(:id).to_i.next+"@gmail.com"

    # byebug
    a = params[:branch_id]
    @user.branch_id = a
    # binding.pry
    if @user.save

      puts '===========firstsave'
      if @user.status.to_i == 2
        puts '===========first if'
        @user.add_role :student
        redirect_to new_admin_path(id: 'student')
      elsif @user.status.to_i == 1
        puts '===========first elsif'
        # byebug
        @user.add_role :faculty
        redirect_to new_admin_path(id: 'faculty')
      end
    else
      render :new, id: 'faculty'
    end
    # redirect_to :back
  end

  def filltable
    @branch_name = Branch.find(params[:branch_id])

    respond_to do |format|
      # format.html { render partial: 'minor_categories_select' }
      format.js
    end
  end

  def edit; end

  def update; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to new_admin_path(id: 'faculty')
  end

  def addfaculty; end

  def import
    User.import(params[:file])
    redirect_to new_admin_path(id: 'student'), notice: 'Students added.'
  end

  def info_params
    puts 'hello'
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:enrollment, :sem, :branch, :pyear, :encrypted_password, :email) }
    # byebug
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status, :pyear, :password, :email, :fname, :lname, :mobile, :password_confirmation)
  end
end
