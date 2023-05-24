class CreateCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.string :kind_of_crop
      t.string :plant_variety
      t.string :sowing_in

      t.timestamps
    end
  end
end
