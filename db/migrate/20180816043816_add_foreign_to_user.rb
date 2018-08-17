class AddForeignToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :book, index: true
  end
end
