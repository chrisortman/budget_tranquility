require 'test_helper'

class RecurringTransactionTest < ActiveSupport::TestCase
  setup do
    tx = RecurringTransaction.new(description: 'Water Bill', amount: 50.00)
    tx.pay_monthly(day: 20)
    tx.save!

  end

  test "can persist the schedule" do 
    tx = RecurringTransaction.find_by(description: 'Water Bill')
    assert_equal '20th of each month', tx.occurs_on
  end

  test "can create weekly schedule from params hash" do
    tx = RecurringTransaction.new
    tx.pay_from_params({:schedule_type => 'weekly', :schedule => {
      :day_of_week => 'monday', :start_on => '1/15/2014'
    }})

    assert_equal 'Every other Monday', tx.occurs_on
  end

  test "can create monthly schedule from params hash" do
    tx = RecurringTransaction.new
    tx.pay_from_params({:schedule_type => 'monthly', :schedule => {
      :day => '15'
    }})

    assert_equal '15th of each month', tx.occurs_on
  end
end
