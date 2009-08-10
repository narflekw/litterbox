class TimeSlot < ActiveRecord::Base
  belongs_to :scheduled, :polymorphic=>true

  # before_save :normalize_month_day_year
  DEFAULT_MONTH = 1
  DEFAULT_DAY = 1
  DEFAULT_YEAR = 2009
  WEEKDAY_SORT_ORDER = %w[ M Monday monday T Tuesday tuesday W Wednesday wednesday R Thursday thursday F Friday friday S Saturday saturday N Sunday sunday]

  def wday
    %w[ N M T W R F S ].index(self.weekday)
  end

  def day_name
    {'N'=>'Sunday','M'=>'Monday','T'=>'Tuesday','W'=>'Wednesday','R'=>'Thursday','F'=>'Friday','S'=>'Saturday'}[self.weekday]
  end

  def current?
    now = Time.now
    return false unless now.wday==self.wday
    start = self.start_at.dup
    local_start = Time.local(now.year, now.month, now.day, start.hour, start.min, start.sec)
    local_end = local_start + self.duration_minutes.minutes
    return true if now.between?( local_start, local_end )
    false
  end
  def show
    return scheduled if scheduled_type == "Show"
  end
  def start_time
    start_at.strftime("%I%p")
  end
  def end_at
    (self.start_at + self.duration_minutes.minutes)
  end
  def end_time
    end_at.strftime("%I%p")
  end

  private
    def normalize_month_day_year
      self.start_at = "#{start_at.strftime("%I %p")} 01/01/2009"
    end

  named_scope :weekday_is, lambda {|day| 
    { :conditions=>{:weekday=>day} }
  }
end
