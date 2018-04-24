require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  def setup
    create_answers_and_ratings
  end

  test "candidates should have answers" do
  	c = candidates(:fred_flintstone)
  	assert c.answers.any?
  end

  test "candidates' answers should have ratings" do
  	c = candidates(:fred_flintstone)
  	assert c.answer_ratings.any?
  end

  test "candidates' answers should have at least 1 0-rating" do
  	c = candidates(:fred_flintstone)
  	assert c.answer_ratings.any? { |ar|  ar.rating == 0 }
  end

  test "the `average_answer_rating` should be the average of the nonzero answer ratings" do
  	c = candidates(:fred_flintstone)
  	ratings = c.answer_ratings.pluck(:rating).reject(&:negative?)
  	assert (ratings.inject(&:+) / ratings.size.to_f), c.average_answer_rating
  end

end
