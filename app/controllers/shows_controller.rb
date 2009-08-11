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
    flash[:success] = "New show created."
    redirect_to shows_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Error creating show. Fix the following and submit again. Arrrr!!!!!<br/>"
    @show = Show.new( params[:show] )
    @show.valid?
    flash[:error] += "#{@show.errors.full_messages.join('<br/>')}"
    render :action=>'new'
  end
end
