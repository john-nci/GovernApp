require "test_helper"

describe QuestionsController do
  let(:question) { questions :one }

  it "gets index" do
    get questions_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_question_url
    value(response).must_be :success?
  end

  it "creates question" do
    expect {
      post questions_url, params: { question: { kind: question.kind, poll_id: question.poll_id, title: question.title } }
    }.must_change "Question.count"

    must_redirect_to question_path(Question.last)
  end

  it "shows question" do
    get question_url(question)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_question_url(question)
    value(response).must_be :success?
  end

  it "updates question" do
    patch question_url(question), params: { question: { kind: question.kind, poll_id: question.poll_id, title: question.title } }
    must_redirect_to question_path(question)
  end

  it "destroys question" do
    expect {
      delete question_url(question)
    }.must_change "Question.count", -1

    must_redirect_to questions_path
  end
end
