class FavoritesController < ApplicationController

  def index
    render :json => Contact.where("user_id = ? AND favorite = 't'", current_user.id)
  end

  def update
    current_user.contacts.find(params[:id])
    contact = Contact.update(params[:id],params[:contact])
    render :json => contact
  end

end
