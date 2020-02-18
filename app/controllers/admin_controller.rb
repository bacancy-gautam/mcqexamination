class AdminController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @user = User.new
    @usershow = User.all
  end

  def create
    puts "                   ------------------hii"
    # byebug
    @user = User.new(info_params)


    if params[:status].to_i==1
      @user.email = @user.enrollment.to_s+"@vatsal.com"
    end

    # @user.email = "vatsal"+User.maximum(:id).to_i.next+"@gmail.com"

    
    a=params[:branch_id]
    @user.branch_id = a
  
    if @user.save!

      puts "===========firstsave"
      if (params[:status].to_i==1)
        puts "===========first if"
        @user.add_role :student
        redirect_to new_admin_path(:id => "student")
      elsif (params[:status].to_i==0)
        puts "===========first elsif"
        # byebug
        @user.add_role :faculty
        redirect_to new_admin_path(:id => "faculty")
      end
      
    end
    # redirect_to :back
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def addfaculty
  end

  def info_params
    puts "hello"
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:enrollment, :sem, :branch, :pyear, :encrypted_password, :email) }
    # byebug
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status, :pyear, :password, :email,:fname,:lname,:mobile, :password_confirmation)
  end



end
