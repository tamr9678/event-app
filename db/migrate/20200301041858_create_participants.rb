class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references  :user,  index: true, foreign_key: true
      t.references  :event, index: true, foreign_key: true
      t.timestamps
    end
  end
end
