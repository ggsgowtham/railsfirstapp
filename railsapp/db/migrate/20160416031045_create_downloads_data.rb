class CreateDownloadsData < ActiveRecord::Migration
  def change
    create_table :downloads_data do |t|

      t.timestamps null: false
    end
  end
end
