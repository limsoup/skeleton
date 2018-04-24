class Interviewer < ApplicationRecord
  has_many :answer_ratings
  has_many :interview_participants
  has_many :interviews,
  	-> {order "interview_date ASC"},
  	through: :interview_participants

  def upcoming_interviews
  	interviews.
  		where("interview_date IS NOT NULL AND interview_date > ?", DateTime.now).
  		limit(2)
  		.to_a
  		.map(&:as_json)
  end


end
