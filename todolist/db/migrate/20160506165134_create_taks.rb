class CreateTaks < ActiveRecord::Migration
  def change
    create_table :taks do |t|
      t.string :name
      t.boolean :complete, default: false, null: false
      t.timestamps null: false
    end
  end
end
