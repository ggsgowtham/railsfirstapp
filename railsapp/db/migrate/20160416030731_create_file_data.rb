class CreateFileData < ActiveRecord::Migration
  def change
    create_table :file_data do |t|

      t.timestamps null: false
    end
  end
end
