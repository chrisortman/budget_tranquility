require 'test_helper'

class MonthlyBill
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

class MonthlyBillTest < ActiveSupport::TestCase

  setup do
    @b = MonthlyBill.new(description: 'Water', amount: 50.00)
    @b.pay_monthly(day: 15)
  end

  test "can pay on certain day of month" do

    assert_equal Date.new(2013,12,15), @b.next_payment(Date.new(2013,12,6)) 
  end

  test "paying on day of month will goto next month if needed" do

    assert_equal Date.new(2014,1,15), @b.next_payment(Date.new(2013,12,16))
  end

  test "will pick closest previous day if day is out of range" do
    @b.pay_monthly(day:31)
    assert_equal Date.new(2013,12,1), @b.next_payment(Date.new(2013,11,2))
  end
end
