class VoteCounter
    class << self
        def count_per_bill poll
            #Groups answers by the title of the poll for each legislation
            votes = poll.replies.answers.groupby { |answer| answer.question_id.poll.title }
            {
                title: "Votes per Bill",
                data: votes.count,
                a_axis: {
                    legend: "Votes per Bill",
                    series: poll.each.title 
                },
                y_axis: {
                    legend: "Number of Votes",
                    scale: [0, votes.max]
                }
            }
        end
        
        def votes_per_bill question 
            #Checks answers to questions and groups results by possible answers
            answer_per_question = question.answers.group_by(&:possible_answer)
            #stores this data in a map with possible answer as the key
            data = answer_per_question.map { |possible_answer, answers| answers.length}
            #Creates series for graph from data
            series = answer_per_question.map { |possible_answer, answers| possible_answer.title}
            {
                title: "Bill Results",
                data: data,
                a_axis: {
                    legend: "Bill Results",
                    series: series 
                },
                y_axis: {
                    legend: "Number of Votes",
                    scale: [0, data.max]
                }
            }
        end
    end
    
end
