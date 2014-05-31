class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, limit: 100, null: false
      t.string :author
      t.date :publish_date
      t.integer :page_count

      t.timestamps
    end
  end
end
