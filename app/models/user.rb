class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :address
  has_one :purchase

  validates :nickname, presence: true
  validates :family_name,
    format: { with: /\A[ー-龥ぁ-ん]/}, presence: true
  validates :first_name,
    format: { with: /\A[ー-龥ぁ-ん]/}, presence: true
  validates :family_name_kana,
    format: { with: /\A[ァ-ヶー-]+\z/ }, presence: true
  validates :first_name_kana,
    format: { with: /\A[ァ-ヶー-]+\z/ }, presence: true
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with:PASSWORD_REGEX

end
