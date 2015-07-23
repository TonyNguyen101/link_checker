class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :href
      t.string :response_code
      t.integer :website_id
      
      t.timestamps null: false
    end
  end
end
