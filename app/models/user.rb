class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX,message: 'Password Include both letters and numbers' }
  with_options presence: true do
  validates :nickname
  validates :birthday
  validates :last_name_zenkaku, :first_name_zenkaku, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'is invalid. Input full-width characters.' }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end
end
