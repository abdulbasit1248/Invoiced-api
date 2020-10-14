class V1::ContactsController < ApplicationController
  def index  
   @contacts = Contact.all
      # c = @contacts.map { |contact| {id: contact.id, first_name: contact.first_name}}
      # render json: {contacts: c}, status: :ok  
      render json: @contacts, status: :created
    end
  
    def create
      @contact = Contact.new(contact_params)
      @contact.save
      render json: @contact, status: :created
    end
  
    def destroy
      @contact = Contact.where(id: params[:id]).first
      if @contact.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end
  
    private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email)
    end
end
