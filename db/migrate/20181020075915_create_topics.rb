class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string       :topic,  null: false
      t.integer      :taiketsu_id, null: false
      t.timestamps
    end
  end
end
