require "test_helper"

describe Answer do
  let(:answer) { Answer.new }

  it "must be valid" do
    value(answer).must_be :valid?
  end
end
