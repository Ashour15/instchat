class Message < ApplicationRecord
  #relationships------------------------------------------
  belongs_to :chat
 
  #validations--------------------------------------------
  validates :body, presence: true

  def as_json(options)
    super({:only => [:body, :number]})
  end
end
