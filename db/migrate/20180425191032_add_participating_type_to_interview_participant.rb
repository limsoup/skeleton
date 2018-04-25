class AddParticipatingTypeToInterviewParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :interview_participants, :participating_type, :string
    rename_column :interview_participants, :interviewer_id, :participating_id
  end
end
