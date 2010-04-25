class UsersController < ApplicationController

  before_filter :find_user, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'Signed up successfully'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = 'Profile updated successfully.'
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  private

  def find_user
    @user = current_user
  end

end
