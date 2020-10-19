class Lead < ApplicationRecord

  STATUSES = %w(todo standby won lost)

  validates :name, presence: true

  validates :status, presence: true, inclusion: { in: STATUSES }

end
