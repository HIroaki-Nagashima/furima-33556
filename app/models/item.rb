class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :barden
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :state_id
    validates :barden_id
    validates :area_id
    validates :day_id
    validates :price
  end
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :barden_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 0 }
  validates :day_id, numericality: { other_than: 1 } 

  validates :price,

numericality: { only_integer: true,

greater_than: 299, less_than: 10000000
}
end
