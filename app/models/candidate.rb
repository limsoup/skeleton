class Candidate < ApplicationRecord
  has_many :interview_participants, as: :participating
  has_many :interviews, through: :interview_participants
  has_many :positions, through: :interviews
  has_many :questions, through: :interviews
  has_many :answers
  has_many :answer_ratings, through: :answers # this is really just for testing
  has_many :valid_answer_ratings, 
  	-> {where "rating > 0"},
  	class_name: "AnswerRating",
  	through: :answers,
  	source: :answer_ratings

  def average_answer_rating
  	valid_answer_ratings.average(:rating)
  end

  def as_json(options={})
  	super(options.merge({only: [:name, :email, :phone]}))
  end

end
