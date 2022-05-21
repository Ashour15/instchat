class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(options = nil)
    super(options || {}).except(*self.class.column_names.select { |c| c.end_with?('_id') || c.start_with?('id') })
  end
end
