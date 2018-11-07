class AddSessionIdToTaiketsus < ActiveRecord::Migration[5.0]
  def change
    add_column :taiketsus, :session_id, :string
  end
end
