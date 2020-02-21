class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title,             null: false
      t.text :place,               null: false
      t.datetime :event_start_at,  null: false
      t.datetime :event_end_at,    null: false
      t.datetime :expire_at,       null: false
      t.text :discription,         null: false
      t.integer :capacity,         null: false
      t.integer :organizer_id,     null: false
      t.timestamps
    end
  end
end
