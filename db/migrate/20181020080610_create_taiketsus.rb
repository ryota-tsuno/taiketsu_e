class CreateTaiketsus < ActiveRecord::Migration[5.0]
  def change
    create_table :taiketsus do |t|

      t.timestamps
    end
  end
end
