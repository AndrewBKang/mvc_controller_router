class ContactsController < ApplicationController

  before_filter :validate_user

  def index
    render :json => Contact.where(:user_id => current_user.id)
  end

  def create
    render :json => Contact.create({:user_id => current_user.id}.merge(params[:contact]))
  end

  def show
    contact = current_user.contacts.find(params[:id])
    render :json => contact
  end

  def update
    current_user.contacts.find(params[:id])
    contact = Contact.update(params[:id],params[:contact])
    render :json => contact
  end

  def destroy
    contact = current_user.contacts.find_by_id(params[:id])
    Contact.destroy(contact.id)
    render :json => {'message' => 'contact destroyed'}
  end
end
