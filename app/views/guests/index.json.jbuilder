json.array!(@guests) do |guest|
  json.extract! guest, :id, :code, :name, :attendance
  json.url guest_url(guest, format: :json)
end
