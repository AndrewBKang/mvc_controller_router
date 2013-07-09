class UsersController < ApplicationController

  skip_before_filter :create, :login

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user
      user_token = SecureRandom.base64
      User.update(user.id, {:token => user_token})
      render :json => {:token => user_token}
    else
      'boo'
    end
  end

  def show
    user = User.find(current_user)
    if user
      render :json => user
    else
      render :json => {:error => 'user not found'}
    end
  end

  def update
    user = User.find(current_user)
    if user
      user = User.update(current_user, params[:user])
      render :json => user
    else
      render :json => {:error => 'user not found'}
    end
  end

  def destroy
    user = User.find(current_user)
    if user
      User.destroy(current_user)
      render :json => {:success => 'user destroyed'}
    else
      render :json => {:error => 'user not found'}
    end
  end

end
