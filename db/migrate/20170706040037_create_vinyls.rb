class CreateVinyls < ActiveRecord::Migration[5.1]
  def change
    create_table :vinyls do |t|
      t.string :title
      t.string :artist
      t.text :notes

      t.timestamps
    end
  end
end
