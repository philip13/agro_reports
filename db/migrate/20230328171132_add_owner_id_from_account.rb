class AddOwnerIdFromAccount < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :owner, foreign_key: { to_table: :users }, null: false
  end
end
