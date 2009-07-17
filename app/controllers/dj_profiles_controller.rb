class DjProfilesController < ApplicationController
  def index
    @djs = DjProfile.all
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@djs.to_xml(:include=>[:shows]) }
      client_wants.json { render :json=>@shows.to_json }
    end
  end

end
