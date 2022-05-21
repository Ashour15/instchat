class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(options = nil)
    super(except: :id)
  end
end
