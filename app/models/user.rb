class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validation
  validates :email,        presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "は半角英数字で'~~~@~~.~~'の形式で入力してください" }
  validates :password,     presence: true, length: {minimum: 7, maximum: 128},    format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i, message: "は半角英数字で、英字と数字を両方含めて設定してください" }
  validates :nickname,     presence: true, length: {maximum: 20}

  # assosiation
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :organize_event, foreign_key: "organizer_id", class_name: "Event"
end
