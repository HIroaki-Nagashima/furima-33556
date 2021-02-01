class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                 message: 'Password Include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    validates :birthday
    kanji = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    katakana = /\A[ァ-ヶー－]+\z/
    validates :last_name_zenkaku, :first_name_zenkaku, format: { with: kanji,
                                                                 message: 'is invalid. Input full-width characters.' }
    validates :last_name_kana, :first_name_kana, format: { with: katakana,
                                                           message: 'is invalid. Input full-width katakana characters.' }
  end
end
