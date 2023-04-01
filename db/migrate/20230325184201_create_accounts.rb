class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :accounts, :name, unique: true
  end
end
