ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def create_answers_and_ratings
    Interview.all.each do |i|
      i.questions.each do |q|
        a = Answer.new(:candidate_id=>i.candidate.id,:interview_id=>i.id,:question_id=>q.id,response: ('a'..'z').to_a.shuffle[0,8].join)
        if a.save
          i.interviewers.each_with_index do |interviewer,j|
            a.answer_ratings.create(interviewer_id: interviewer.id, 
              rating: j > 0 ? rand(5) : 0
              )
          end
        end
      end
    end
  end
end
