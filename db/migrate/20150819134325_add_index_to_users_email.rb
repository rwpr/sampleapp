# rails g migration add_index_to_users_email
class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique:true
  	# to add an index on the email column of the users table.
  end
end
