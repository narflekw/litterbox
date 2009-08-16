class ShowsController < ApplicationController
  before_filter :find_from_id, :only=>[:show, :edit, :update, :destroy]
  @@api_output_options = {:skip_types => true,
                          :except => [:created_at, :updated_at], 
                          :include => { :time_slots=>{:only=>[:weekday,:start_at, :duration_minutes]},
                                        :owner=>{:only=>[:email, :name, :facebook_url, :twitter_id]} 
                                      }
                         }
  def index
    @shows = Show.all :order=>'name'
    @section_title = "These be arrrr shows."
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@shows.to_xml( @@api_output_options ) }
      client_wants.json { render :json=>@shows.to_json( @@api_output_options ) }
    end
  end
  def show
    respond_to do|client_wants|
      client_wants.html { render :inline=>"<%= render(:partial=>@show) %>" }
      client_wants.xml { render :xml=>@show.to_xml( @@api_output_options ) }
      client_wants.json { render :json=>@show.to_json( @@api_output_options ) }
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
    add_owner_error_message if @show.errors.invalid?(:owner_id)
    render :action=>'new'
  end

  def edit
  end
  def update
    @show.attributes = params[:show]
    if @show.changed?
      if @show.save
        flash[:success] = "Saved changes to Show #{@show.id}"
        redirect_to :action=>'index'
      else
        flash[:error] = "Error updating show. Fix the <span class='inline-errors'>following</span> and submit again. Arrrr!!!!!<br/>"
        add_owner_error_message if @show.errors.invalid?(:owner_id)
        render :action=>'edit'
      end
    else
      flash[:notice] = "No changes to save"
      render :action=>'edit'
    end
  end

  def destroy
    @show.destroy
    flash[:success] = "Deleted Show #{@show.id}"
    redirect_to :action=>'index'
  end

  protected
    def find_from_id
      @show = Show.find( params[:id] )
    end
    def add_owner_error_message
      flash[:error] ||= ""
      flash[:error] += "<span class='inline-errors'>Owner #{@show.errors.generate_message(:owner, :blank)}</span>"
    end
end
