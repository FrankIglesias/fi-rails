class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.date :from
      t.date :to
      t.belongs_to :book
      t.belongs_to :user


      t.timestamps
    end
  end
end
