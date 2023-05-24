class CreateSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :phenological_state
      t.references :client, null: false, foreign_key: true
      t.references :crop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
