json.array!(@drivers) do |driver|
  json.extract! driver, :id, :comment, :name, :content_type, :data, :name, :number, :address, :price
  json.url driver_url(driver, format: :json)
end
