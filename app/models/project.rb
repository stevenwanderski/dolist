class Project < ApplicationRecord
  has_many :tasks

  def active_tasks
    self
      .tasks
      .order(created_at: :asc)
      .where(is_completed: false)
  end
end
