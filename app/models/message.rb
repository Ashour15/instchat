class Message < ApplicationRecord
  #relationships------------------------------------------
  belongs_to :chat
 
  #validations--------------------------------------------
  validates :body, presence: true
end
