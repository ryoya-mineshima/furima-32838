class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
       validates :nickname
       validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
       validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
       validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
       validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
       validates :birth_day
       validates :password, :password_confirmation, length: { minimum: 6 },
                                                                      format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  end
end
