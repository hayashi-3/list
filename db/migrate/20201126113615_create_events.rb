class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :event_name, null: false
      t.text :event_content, null: false
      t.datetime :event_date, null: false
      t.string :branch, null: false
      t.string :organizer, null: false
      t.string :secretary, null: false
      t.string :executive_director, null: false
      t.string :nearest_station
      t.string :place
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
