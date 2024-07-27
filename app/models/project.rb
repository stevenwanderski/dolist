# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  color      :string
#  name       :string
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
  positioned on: :user, column: :weight

  def active_tasks
    self
      .tasks
      .order(weight: :asc)
      .where(is_completed: false)
  end
end
