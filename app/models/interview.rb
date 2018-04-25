class Interview < ApplicationRecord
  
  belongs_to :position
  # belongs_to :candidate
  has_many :interview_questions,
   -> { order "display_order ASC" }
  has_many :interview_participants
  has_many :questions, through: :interview_questions
  has_many :interviewers, through: :interview_participants, source: :participating, source_type: 'Interviewer'
  has_many :candidates, through: :interview_participants, source: :participating, source_type: 'Candidate'

  def candidate
    candidates.try(:first)
  end

  def candidate=(cand)
    candidates = [cand]
  end

  def as_json(options={})
  	super({only: [:description, :interview_date], 
  		include: { 
  			questions: {only: [:question]},
  		},
      methods: :candidate
    })
  end

end
