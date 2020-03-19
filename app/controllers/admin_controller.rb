# frozen_string_literal: true

# admincontroller
class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[edit update destroy]
  def new
    @user = User.new
  end

  def create
    params['student_ids']&.each do |student_id, _student_value|
      student = User.find(student_id)
      semester = Semester.find(student.semester_id)
      (new_sem = semester.sem + 1) if params[:operation] == 'promote'
      (new_sem = semester.sem - 1) if params[:operation] == 'demote'
      semester = Semester.where(sem: new_sem).first
      student.update_column(:semester_id, semester.id)
    end
    redirect_to promote_student_admin_index_path, notice: 'Done!!'
  end

  def filltable
    @branch_name = Branch.find(params[:branch_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user.destroy!
    redirect_to new_admin_path(id: 'faculty')
  end

  def import
    imported, skipped = User.import(params[:file])
    # binding.pry
    flash[:notice] = "#{imported} Students added, #{skipped} Students skipped"
    redirect_to new_student_path
  end

  def import_faculty
    User.import(params[:file])
    redirect_to new_faculty_path, notice: 'Faculty added.'
  end

  def search
    @user = User.with_role(:student).where(branch_id: params[:branch_id],
                                           semester_id: params[:semester_id])
                .order(:enrollment)
    render json: { name: @user }
  end

  def search_by_enrollment
    @user = User.with_role(:student).where(enrollment: params[:enrollment])
    render json: { name: @user }
  end

  def search_by_branch
    # binding.pry
    @user = User.with_role(:faculty).where(branch_id: params[:branch_id])
    render json: { name: @user }
  end

  private

  def admin_params
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pass_out_year, :password, :email, :fname,
                                  :lname, :mobile, :password_confirmation)
  end

  def student_params
    params.permit(:operation, :student_ids)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
