class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :fridge, optional:true
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数を両方含む必要があります' }

  with_options presence: true do
    validates :nickname, uniqueness: {case_sensitive: true}
    validates :gender
    validates :birthday
  end
end
