class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :barden_id
    validates :day_id
  end
  validates :area_id, numericality: { other_than: 0 }

  validates :price,
            numericality: { only_integer: true,

                            greater_than: 299, less_than: 10_000_000 }
end
