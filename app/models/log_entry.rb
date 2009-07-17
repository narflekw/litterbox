class LogEntry < ActiveRecord::Base
  belongs_to :broadcast
  belongs_to :logged, :polymorphic=>true
end
