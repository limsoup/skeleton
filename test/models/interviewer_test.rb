require 'test_helper'

class InterviewerTest < ActiveSupport::TestCase
  def setup
  	create_answers_and_ratings
  end

  test "the upcoming interviews should have 2 interviews" do
  	i = interviewers(:fleet_manager)
  	assert i.upcoming_interviews.count == 2
  end

  test "the 2 upcoming interviews should be the ones closest from now" do
  	i = interviewers(:fleet_manager)
  	assert (i.upcoming_interviews.first["description"] ==
  		     	"Interviewing Fred Flintstone for the truck driver position" ) and 
  			(i.upcoming_interviews[1]["description"] ==
  		  		"Interviewing Barney Rubble for the truck driver position")
  end

  test "an interview in the upcoming interviews should have the questions with the question text" do
  	i = interviewers(:fleet_manager)
  	questions = i.upcoming_interviews.first["questions"]
  	assert (questions.any? and questions.first["question"].is_a? String)
  end

  test "an interview in the upcoming interviews should have a candidate" do
  	i = interviewers(:fleet_manager)
  	candidate = i.upcoming_interviews.first["candidate"]
  	assert (!candidate.nil? and !candidate["name"].blank? )
  end

end
