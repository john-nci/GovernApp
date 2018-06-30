require "test_helper"

describe Poll do
  let(:poll) { Poll.new }

  it "must be valid" do
    value(poll).must_be :valid?
  end
end
