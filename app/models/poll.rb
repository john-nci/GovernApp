class Poll < ApplicationRecord
    validates_presence_of :title
    
    has_many :questions 
    has_many :replies
    
    def gather_votes_for_graph
        VoteCounter.votes_per_bill(self).to_json
    end
end
