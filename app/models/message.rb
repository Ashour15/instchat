class Message < ApplicationRecord
  include Searchable
  Message.import force: true

  #relationships------------------------------------------
  belongs_to :chat
 
  #validations--------------------------------------------
  validates :body, presence: true

  def as_json(options)
    super({:only => [:body, :number]})
  end
end
