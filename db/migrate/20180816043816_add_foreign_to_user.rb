class AddForeignToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :book, index: true
  end
end
