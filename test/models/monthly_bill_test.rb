require 'test_helper'

class RecurringTransaction
  def initialize(description: 'Recurring payment', amount: 0.0)
    @description = description
    @amount = amount
  end

  def pay_monthly(day: 1)
    @pay_on_day = day
  end

  def next_payment(from)
    pay_day = from.advance(days: @pay_on_day - from.day)
    pay_day < from ? pay_day.next_month : pay_day
  end
end

describe RecurringTransaction do

  before do
    @tx = RecurringTransaction.new(description: 'Water', amount: 50.00)
  end

  describe "recurs on a certain day of the month" do

    before do
      @tx.pay_monthly(day: 15)
    end

    it "can figure out the next payment" do
      @tx.next_payment(Date.new(2013,12,6)).must_equal Date.new(2013,12,15)
    end

    it "can advance a month if needed" do
      @tx.next_payment(Date.new(2013,12,16)).must_equal Date.new(2014,1,15)
    end

    it "will pick closest next day if day is out of range" do
      @tx.pay_monthly(day:31)
      @tx.next_payment(Date.new(2013,11,2)).must_equal Date.new(2013,12,1)
    end

  end

end

