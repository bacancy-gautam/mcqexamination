# frozen_string_literal: true

# controller for student related task
class StudentController < ApplicationController
  def new
    #  @user = Usaer.new
    @user = User.new
    @usershow = User.all
  end

  def create
    puts '   ------------------hii'
    # byebug
    @user = User.new(info_params)
    a = params[:branch_id]
    @user.branch_id = a

    if @user.save
      @user.add_role :student
      redirect_to new_student_path
    end
  end

  def update; end

  def edit; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to new_faculty_path
  end

  def show; end

  def index; end

  def info_params
    # puts "fac hello"
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end

  def download_excel
    puts '==============================in download'
    send_file(
      "#{Rails.root}/public/v1.csv",
      filename: 'add_student.csv',
      type: 'application/csv'
    )
  end
end
