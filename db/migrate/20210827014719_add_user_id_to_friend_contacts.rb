class AddUserIdToFriendContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :friend_contacts, :user_id, :string
    add_column :friend_contacts, :integer, :string
    add_index :friend_contacts, :integer
  end
end
