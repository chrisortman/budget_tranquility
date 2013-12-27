json.array!(@recurring_transactions) do |recurring_transaction|
  json.extract! recurring_transaction, :id, :description, :amount, :schedule
  json.url recurring_transaction_url(recurring_transaction, format: :json)
end
