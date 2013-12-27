require 'test_helper'

class RecurringTransaction

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
      ""
    end
  end


  def initialize(description: 'Recurring payment', amount: 0.0)
    @description = description
    @amount = amount
  end

  def pay_monthly(day: 1)
    @schedule = MonthlySchedule.new(day: day)
  end

  def pay_biweekly(day_of_week: :friday, start_on: Date.current)
    @schedule = WeeklySchedule.new(day_of_week: day_of_week, start_on: start_on)
  end

  def next_occurrence(from)
    @schedule.next(from)
  end

  def occurs_on
    @schedule.occurs_on
  end
end

describe RecurringTransaction do

  before do
    @tx = RecurringTransaction.new(description: 'Water', amount: 50.00)
  end

  describe "on a certain date of the month" do

    before do
      @tx.pay_monthly(day: 15)
    end

    it "can figure out the next occurrence" do
      @tx.next_occurrence(Date.new(2013,12,6)).must_equal Date.new(2013,12,15)
    end

    it "can advance a month if needed" do
      @tx.next_occurrence(Date.new(2013,12,16)).must_equal Date.new(2014,1,15)
    end

    it "will pick closest next day if day is out of range" do
      @tx.pay_monthly(day:31)
      @tx.next_occurrence(Date.new(2013,11,2)).must_equal Date.new(2013,12,1)
    end

    it "describe when it occurs" do
      @tx.occurs_on.must_equal "15th of each month"
    end

  end

  describe "on a certain day of the week" do
    before do
      @tx.pay_biweekly day_of_week: :friday, start_on: Date.new(2013,12,6)
    end

    it "can figure out the next occurrence" do
      @tx.next_occurrence(Date.new(2013,12,7)).must_equal Date.new(2013,12,20)
    end
  end

end

