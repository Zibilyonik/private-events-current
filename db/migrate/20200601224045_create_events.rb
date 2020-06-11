class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
