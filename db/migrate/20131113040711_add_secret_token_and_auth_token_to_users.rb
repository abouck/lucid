class AddSecretTokenAndAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secret_token, :string
    add_column :users, :auth_token, :string
  end
end
