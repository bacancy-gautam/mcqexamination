class AdminController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(info_params)
    if @user.save
      redirect_to admin_index_path
    end
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
    params.required(:info).permit(:name, :password, :address)
  end



end
