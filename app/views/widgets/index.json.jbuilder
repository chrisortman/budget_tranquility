json.array!(@widgets) do |widget|
  json.extract! widget, :id, :title, :quantity, :price, :sellable
  json.url widget_url(widget, format: :json)
end
