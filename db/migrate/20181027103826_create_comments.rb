class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text        :text, null: false
      t.integer     :topic_id, null: false, foreign_key: true
      t.string      :session_id
      t.timestamps
    end
  end
end
