class Task < ApplicationRecord
  enum status: [:active, :completed]

  belongs_to :offer, optional: true
  belongs_to :project, optional: true
end
