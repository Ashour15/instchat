class ChatApplication < ApplicationRecord
  has_secure_token
  
  #relationships------------------------------------------
  has_many :chats, dependent: :destroy
  
  #validations--------------------------------------------
  validates :name, presence: true
end
