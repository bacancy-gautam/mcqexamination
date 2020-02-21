class FacultyController < ApplicationController
  def index; end

  def show; end

  def new
    @user = User.new
    @usershow = User.all
  end

  def edit; end

  def update; end

  def create
    @user = User.new(info_params)
    a = params[:branch_id]
    @user.branch_id = a
    if @user.save!
      puts '===========firstsave'
      @user.add_role :faculty
      redirect_to new_faculty_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to new_faculty_path
  end

  def info_params
    # puts "fac hello"
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end
end
