class ShowsController < ApplicationController
  def index
    @shows = Show.all :order=>'name'
    @section_title = "These be arrrr shows."
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@shows.to_xml(:skip_types => true,
                                                    :except => [:created_at, :updated_at], 
                                                    :include => { :time_slots=>{:only=>[:weekday,:start_at, :duration_minutes]},
                                                                  :owner=>{:only=>[:email, :name, :facebook_url, :twitter_id]} 
                                                                }
                                                   )
                       }
      client_wants.json { render :json=>@shows.to_json(:skip_types => true,
                                                    :except => [:created_at, :updated_at], 
                                                    :include => { :time_slots=>{:only=>[:weekday,:start_at, :duration_minutes]},
                                                                  :owner=>{:only=>[:email, :name, :facebook_url, :twitter_id]} 
                                                                }
                                                   ) 
                        }
    end
  end

  def new
    @show = Show.new
  end
  def create
    @show = Show.create!( params[:show] )
    flash[:notice] = "New show created."
    redirect_to shows_path
  end
end
