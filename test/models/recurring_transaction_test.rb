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
end
