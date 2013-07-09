class UsersController < ApplicationController

  def index
    #render :json => {'key_to_index'=>"I'm in the index action!"}.to_json
    render :json => User.all
  end

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by_id(params[:id])
    if user
      render :json => user
    else
      render :json => 'user not found'
    end
  end

  def update
    user = User.find_by_id(params[:id])
    if user
      user = User.update(params[:id], params[:user])
      render :json => user
    else
      render :json => 'user not found'
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user
      User.destroy(params[:id])
      render :json => 'user destroyed'
    else
      render :json => 'user not found'
    end
  end

end
