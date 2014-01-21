json.array!(@envelopes) do |envelope|
  json.extract! envelope, :id, :label, :per_month, :per_check
  json.url envelope_url(envelope, format: :json)
end
