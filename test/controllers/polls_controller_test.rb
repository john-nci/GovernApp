require "test_helper"

describe PollsController do
  let(:poll) { polls :one }

  it "gets index" do
    get polls_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_poll_url
    value(response).must_be :success?
  end

  it "creates poll" do
    expect {
      post polls_url, params: { poll: { title: poll.title } }
    }.must_change "Poll.count"

    must_redirect_to poll_path(Poll.last)
  end

  it "shows poll" do
    get poll_url(poll)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_poll_url(poll)
    value(response).must_be :success?
  end

  it "updates poll" do
    patch poll_url(poll), params: { poll: { title: poll.title } }
    must_redirect_to poll_path(poll)
  end

  it "destroys poll" do
    expect {
      delete poll_url(poll)
    }.must_change "Poll.count", -1

    must_redirect_to polls_path
  end
end
