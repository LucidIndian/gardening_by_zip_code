class Garden < ApplicationRecord
  belongs_to :user
  validates :name, :zip, presence: true 
end
