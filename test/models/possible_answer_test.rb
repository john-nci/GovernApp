require "test_helper"

describe PossibleAnswer do
  let(:possible_answer) { PossibleAnswer.new }

  it "must be valid" do
    value(possible_answer).must_be :valid?
  end
end
