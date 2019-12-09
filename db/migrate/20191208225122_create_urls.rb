class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :token
      t.integer :clicks_count, default: 0
      t.timestamps
    end

    add_index :urls, :token
  end
end
