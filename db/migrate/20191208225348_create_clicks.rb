class CreateClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|
      t.references :url
      t.string :browser
      t.string :platform
      t.string :user_agent
      t.string :ip
      t.string :location
      t.timestamps
    end
  end
end
