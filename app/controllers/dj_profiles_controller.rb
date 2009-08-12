class DjProfilesController < ApplicationController
  def index
    @djs = DjProfile.all :order=>'name'
    @section_title = "These be arrrr DJs."
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@djs.to_xml(:include=>[:shows]) }
      client_wants.json { render :json=>@shows.to_json }
    end
  end

  def new
    @dj_profile = DjProfile.new
  end
  def create
    @dj_profile = DjProfile.create!( params[:dj_profile] )
    flash[:success] = "New DJ created."
    redirect_to dj_profiles_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Error creating DJ. Fix the following and submit again. Arrrr!!!!!<br/>"
    @dj_profile = DjProfile.new( params[:dj_profile] )
    @dj_profile.valid?
    flash[:error] += "#{@dj_profile.errors.full_messages.join('<br/>')}"
    render :action=>'new'
  end
end
