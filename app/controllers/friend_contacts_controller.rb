class FriendContactsController < ApplicationController
  before_action :set_friend_contact, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /friend_contacts or /friend_contacts.json
  def index
    @friend_contacts = FriendContact.all
  end

  # GET /friend_contacts/1 or /friend_contacts/1.json
  def show
  end

  # GET /friend_contacts/new
  def new
    #@friend_contact = FriendContact.new
    @friend_contact = current_user.friend_contacts.build
  end

  # GET /friend_contacts/1/edit
  def edit
  end

  # POST /friend_contacts or /friend_contacts.json
  def create
    #@friend_contact = FriendContact.new(friend_contact_params)
    @friend_contact = current_user.friend_contacts.build(friend_contact_params)

    respond_to do |format|
      if @friend_contact.save
        format.html { redirect_to @friend_contact, notice: "Friend contact was successfully created." }
        format.json { render :show, status: :created, location: @friend_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_contacts/1 or /friend_contacts/1.json
  def update
    respond_to do |format|
      if @friend_contact.update(friend_contact_params)
        format.html { redirect_to @friend_contact, notice: "Friend contact was successfully updated." }
        format.json { render :show, status: :ok, location: @friend_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_contacts/1 or /friend_contacts/1.json
  def destroy
    @friend_contact.destroy
    respond_to do |format|
      format.html { redirect_to friend_contacts_url, notice: "Friend contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend_contact = current_user.friend_contacts.find_by(id: params[:id])
    redirect_to friend_contacts_path, notice: "Not Authorized to Edit this friend" if @friend_contact.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_contact
      @friend_contact = FriendContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_contact_params
      params.require(:friend_contact).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
