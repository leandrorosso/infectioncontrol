class CreateBacteria < ActiveRecord::Migration[7.0]
  def change
    create_table :bacteria do |t|
      t.string :description

      t.timestamps
    end
  end
end
