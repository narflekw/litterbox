class TimeSlotsController < ApplicationController
  def index
    day = params[:weekday]
    @time_slots = TimeSlot.weekday_is( day ).find(:all, :order=>'weekday, start_at') if day
    @time_slots ||= TimeSlot.all(:order=>'weekday, start_at')
    respond_to do|client_wants|
      client_wants.html {}
      client_wants.xml { render :xml=>@time_slots.to_xml(:skip_types => true,
                                                         :except => [:scheduled_id, :created_at, :updated_at, :start_at], 
                                                         :methods => [:start_time, :end_time],
                                                         :include => { :scheduled=>{:only=>[:id,:name]}
                                                                     }
                                                        ) }
    end
  end
  
end
