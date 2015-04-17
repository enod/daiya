json.array!(@recievers) do |reciever|
  json.extract! reciever, :id, :stuff, :description, :source_address, :destination_address, :from, :to, :phone, :mail, :fee
  json.url reciever_url(reciever, format: :json)
end
