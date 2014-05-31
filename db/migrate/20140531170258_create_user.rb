class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :password
      t.string :email
      t.date :birth_day

      t.timestamps
    end
  end
end
