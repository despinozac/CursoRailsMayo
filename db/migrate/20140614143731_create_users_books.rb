class CreateUsersBooks < ActiveRecord::Migration
  def change
    create_table :books_users do |t|
      t.references :user, index:true
      t.references :book, index:true
      t.date :start_date
      t.date :finish_date
      
      t.timestamps
    end
  end
end
