class AddMessageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :message, :text
  end
end
