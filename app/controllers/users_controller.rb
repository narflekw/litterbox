class UsersController < ApplicationController
  before_filter :find_from_id, :only => %w[show edit update destroy]
  def index
    @users = User.all :order=>'email'
    @section_title = "These be the Usarrrrs."
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@users.to_xml( @@api_output_options ) }
      client_wants.json { render :json=>@users.to_json( @@api_output_options ) }
    end
  end
  def show
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@users.to_xml( @@api_output_options ) }
      client_wants.json { render :json=>@users.to_json( @@api_output_options ) }
    end
  end


  def new
    @user = User.new
  end
  def create
    @user = User.create!( params[:user] )
    flash[:success] = "New User created."
    redirect_to users_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Error creating User. Fix the <span class='inline-errors'>following</span> and submit again. Arrrr!!!!!<br/>"
    @user = User.new( params[:user] )
    @user.valid?
    render :action=>'new'
  end

  def edit
  end
  def update
    @user.attributes = params[:user]
    if @user.changed?
      if @user.save
        flash[:success] = "Saved changes to User #{@user.id}"
        redirect_to :action=>'index'
      else
        flash[:error] = "Error updating User. Fix the <span class='inline-errors'>following</span> and submit again. Arrrr!!!!!<br/>"
        render :action=>'edit'
      end
    else
      flash[:notice] = "No changes to save"
      render :action=>'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Deleted User #{@user.id}"
    redirect_to :action=>'index'
  end

  protected
    def find_from_id
      @user = User.find( params[:id] )
    end
end
