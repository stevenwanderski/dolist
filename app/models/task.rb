class Task < ApplicationRecord
  belongs_to :project
  positioned on: :project, column: :weight
end
