class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def active_tasks
    self
      .tasks
      .order(weight: :asc)
      .where(is_completed: false)
  end
end