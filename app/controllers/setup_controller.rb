class SetupController < ApplicationController
  def index
  end

  def paychecks
    @new_paycheck = RecurringTransaction.new(transaction_type: :paycheck)
  end

  def bills
  end

  def envelopes
  end
end
