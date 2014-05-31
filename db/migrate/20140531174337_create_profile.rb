class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :phone
      t.string :country
      t.string :city
      t.integer :zip_code
      t.string :line1
      t.string :line2
      t.string :url_gravatar
      t.references :user, index: true
    end
  end
end
