class Question < ApplicationRecord
  belongs_to :poll
  has_many :possible_answers
  has_many :answers 
  accepts_nested_attributes_for :possible_answers, reject_if: proc { |attributes| attributes['title'].blank? }
  
  def gather_votes_for_graph
    VoteCounter.votes_per_bill(self).to_json
  end 
  
end
