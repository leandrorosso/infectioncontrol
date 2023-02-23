class CreateInfections < ActiveRecord::Migration[7.0]
  def change
    create_table :infections do |t|
      t.string :description
      t.boolean :active
      t.references :bacterium, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
