class Chat < ApplicationRecord
  #relationships------------------------------------------
  belongs_to :chat_application
  has_many :messages, dependent: :destroy
 
  #validations--------------------------------------------
  validates_uniqueness_of :number, scope: :chat_application_id

  def as_json(options)
    super({:only => [:number]})
  end
end
