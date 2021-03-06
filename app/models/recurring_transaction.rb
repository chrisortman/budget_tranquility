require 'schedule'

class RecurringTransaction < ActiveRecord::Base
  
  belongs_to :user
  
  before_save :serialize_schedule
  after_find  :deserialize_schedule

  def pay_monthly(day: 1)
    self.schedule_type = :monthly
    @schedule = MonthlySchedule.new(day: day)
  end

  def pay_biweekly(day_of_week: :friday, start_on: Date.current)
    self.schedule_type = :weekly
    @schedule = WeeklySchedule.new(day_of_week: day_of_week, start_on: start_on)
  end

  def pay_from_params(params) 

    if params[:schedule_type] == 'weekly'
      dow = params[:day_of_week].to_sym
      start_on = params[:start_on]
      start_on = Date.strptime(start_on,"%m/%d/%Y")
      self.pay_biweekly day_of_week: dow, start_on: start_on
    elsif params[:schedule_type] == 'monthly'
      day = params[:day].to_i
      self.pay_monthly(day: day)
    end
  end

  def next_occurrence(from)
    @schedule.next(from)
  end

  def occurs_on
    @schedule.occurs_on
  end

  def schedule
    @schedule
  end

  protected
  def serialize_schedule
    if @schedule
      self.schedule_json = ActiveSupport::JSON.encode(@schedule)
    end
  end

  def deserialize_schedule
    if self.schedule_json
      begin
        sched_data = ActiveSupport::JSON.decode(self.schedule_json)
        case self.schedule_type.to_sym
        when :monthly
          @schedule = MonthlySchedule.new(day: sched_data['pay_on_day'])
        when :weekly
          @schedule = WeeklySchedule.new(day_of_week: sched_data['pay_weekly'] , start_on: sched_data['pay_weekly_start'])
        end
      rescue MultiJson::LoadError
        @schedule = MonthlySchedule.new(day:1)
      end
    end
  end
end
