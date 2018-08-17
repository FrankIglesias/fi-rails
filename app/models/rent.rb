class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :to, :from, presence: true
end
