class HomeController < ApplicationController
  def index
    if session[:user_id] and user = User.find(session[:user_id])
      if recurring_entries = RecurringTransaction.find_all_by_user_id(user.id)

        recurring_entries = recurring_entries.group_by { |tx| tx.transaction_type.downcase.to_sym}
        if recurring_entries[:paycheck]
          @paycheck_count = recurring_entries[:paycheck].size
          @paycheck_total = recurring_entries[:paycheck].inject(0) {|sum,n| sum + n.amount}
        else
          @paycheck_count = 0
          @paycheck_total = 0
        end

        if recurring_entries[:bill]
          @bill_count = recurring_entries[:bill].size
          @bill_total = recurring_entries[:bill].inject(0) { |sum,n| sum + n.amount}
        else
          @bill_count = 0
          @bill_total = 0
        end

        envelopes = Envelope.find_all_by_user_id(user.id)
        if envelopes
          @envelope_count = envelopes.size
          @envelope_total = envelopes.inject(0) do |sum,n| 
            if n.per_check
              sum += n.per_check
            elsif n.per_month
              sum += n.per_month
            end
          end
        else
          @envelope_count = 0
          @envelope_total = 0
        end

      else
        @paycheck_count = 0
        @paycheck_total = 0
        @bill_count = 0
        @bill_total = 0
      end

     
    else
      redirect_to login_url
    end
  end

  def setup
  end
end
