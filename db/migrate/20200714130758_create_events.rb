class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.text :description
      t.string :address
      t.boolean :active, null: false, default: true
      t.references :user

      t.timestamps
    end
  end
end
