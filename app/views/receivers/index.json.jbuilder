json.array!(@receivers) do |receiver|
  json.extract! receiver, :id, :stuff, :description, :source_address, :destination_address, :from, :to, :phone, :mail, :fee, :user_id
  json.url receiver_url(receiver, format: :json)
end
