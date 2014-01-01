class MonthlySchedule
  def initialize(day: 1)
    @pay_on_day = day
  end

  def next(from)
    pay_day = from.advance(days: @pay_on_day - from.day)
    return pay_day < from ? pay_day.next_month : pay_day
  end

  def occurs_on
    "#{@pay_on_day.ordinalize} of each month"
  end
end

class WeeklySchedule
  def initialize(day_of_week: :friday, start_on: Date.current)
    @pay_weekly = day_of_week
    @pay_weekly_start = start_on
  end

  def next(from)
    pay_day = @pay_weekly_start
    if pay_day <= from
      while pay_day < from
        pay_day = pay_day.advance(weeks: 2)
      end
      return pay_day
    end
  end

  def occurs_on
    "Every other #{@pay_weekly.capitalize}"
  end
end