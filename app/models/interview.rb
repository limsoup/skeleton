class Interview < ApplicationRecord
  
  belongs_to :position
  belongs_to :candidate
  has_many :interview_questions,
   -> { order "display_order ASC" }
  has_many :interview_participants
  has_many :questions, through: :interview_questions
  has_many :interviewers, through: :interview_participants


  def as_json(options={})
  	super(only: [:description, :interview_date], 
  		include: {
  			candidate: {only: [:name, :email, :phone]}, 
  			questions: {only: [:question]}
  			})
  end

end
