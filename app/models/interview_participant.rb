class InterviewParticipant < ApplicationRecord
  belongs_to :interview
  belongs_to :participating, polymorphic: true
end
