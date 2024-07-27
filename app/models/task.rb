# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  description  :text
#  is_completed :boolean          default(FALSE)
#  name         :string
#  weight       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :integer
#  user_id      :integer
#
class Task < ApplicationRecord
  belongs_to :project
  positioned on: :project, column: :weight
end
