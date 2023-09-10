# 4th week assignment
# Create an interactive quiz game in Ruby that allows users to play quizzes on various topics. The game should provide multiple-choice questions, keep score, and display results at the end of each quiz.


class Quiz
	attr_accessor :question, :answer
	def initialize(question, answer)
		@question = question
		@answer = answer
	end
end

question1 = "How many days in a week?\n(a) 3 days\n(b) 7 days\n(c) 8 days"
question2 = "What is the color of an apple?\n(a) red\n(b) blue\n(c) yellow"

questions = [
	Quiz.new(question1, "b"),
	Quiz.new(question2, "a")
]

def run_quiz(questions)
	answer = ""
	score = 0

	for item in questions
        puts item.question
        answer = gets.chomp.to_s
        while answer != "a" && answer != "b" && answer != "c"
        	puts "Invalid"
        	answer = gets.chomp.to_s
        end

        if answer == item.answer
			score += 1
		end
    end
    
	puts "Score is #{score}/#{questions.length}"
end

run_quiz(questions)

    
