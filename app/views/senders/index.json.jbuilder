json.array!(@senders) do |sender|
  json.extract! sender, :id, :source_address, :destination_address, :description, :arrival, :phone, :mail, :fee, :user_id
  json.url sender_url(sender, format: :json)
end
