class DjProfilesController < ApplicationController
  before_filter :find_from_id, :only => %w[show edit update destroy]
  @@api_output_options = {:skip_types => true,
                          :include=>{ :shows => {:only=>[:id,:name]}}}
  def index
    @djs = DjProfile.all :order=>'name'
    @section_title = "These be arrrr DJs."
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@djs.to_xml( @@api_output_options ) }
      client_wants.json { render :json=>@djs.to_json( @@api_output_options ) }
    end
  end
  def show
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@djs.to_xml( @@api_output_options ) }
      client_wants.json { render :json=>@djs.to_json( @@api_output_options ) }
    end
  end


  def new
    @dj_profile = DjProfile.new
  end
  def create
    @dj_profile = DjProfile.create!( params[:dj_profile] )
    flash[:success] = "New DJ Profile created."
    redirect_to dj_profiles_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Error creating DJ Profile. Fix the following and submit again. Arrrr!!!!!<br/>"
    @dj_profile = DjProfile.new( params[:dj_profile] )
    @dj_profile.valid?
    flash[:error] += "#{@dj_profile.errors.full_messages.join('<br/>')}"
    render :action=>'new'
  end

  def edit
  end
  def update
    @dj_profile.attributes = params[:dj_profile]
    if @dj_profile.changed?
      if @dj_profile.save
        flash[:success] = "Saved changes to DJ Profile #{@dj_profile.id}"
        redirect_to :action=>'index'
      else
        flash[:error] = "Error updating DJ Profile. Fix the <span class='inline-errors'>following</span> and submit again. Arrrr!!!!!<br/>"
        add_user_error_message if @dj_profile.errors.invalid?(:user_id)
        render :action=>'edit'
      end
    else
      flash[:notice] = "No changes to save"
      render :action=>'edit'
    end
  end

  def destroy
    @dj_profile.destroy
    flash[:success] = "Deleted DJ Profile #{@dj_profile.id}"
    redirect_to :action=>'index'
  end

  protected
    def find_from_id
      @dj_profile = DjProfile.find( params[:id] )
    end
    def add_user_error_message
      flash[:error] ||= ""
      flash[:error] += "User "+@dj_profile.errors.generate_message(:user, :blank)
    end
end
