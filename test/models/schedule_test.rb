require 'test_helper'

describe MonthlySchedule do

  before do
    @tx = MonthlySchedule.new(day: 15)
  end

  describe "on a certain date of the month" do

    it "can figure out the next occurrence" do
      @tx.next(Date.new(2013,12,6)).must_equal Date.new(2013,12,15)
    end

    it "can advance a month if needed" do
      @tx.next(Date.new(2013,12,16)).must_equal Date.new(2014,1,15)
    end

    it "will pick closest next day if day is out of range" do
      @tx = MonthlySchedule.new(day:31)
      @tx.next(Date.new(2013,11,2)).must_equal Date.new(2013,12,1)
    end

    it "describe when it occurs" do
      @tx.occurs_on.must_equal "15th of each month"
    end

  end

  describe "on a certain day of the week" do
  end

end

describe WeeklySchedule do
  before do
    @tx = WeeklySchedule.new(day_of_week: :friday, start_on: Date.new(2013,12,6))
  end

  it "can figure out the next occurrence" do
    @tx.next(Date.new(2013,12,7)).must_equal Date.new(2013,12,20)
  end

end