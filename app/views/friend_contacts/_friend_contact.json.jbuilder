json.extract! friend_contact, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url friend_contact_url(friend_contact, format: :json)
