# 4th week assignment
# Create an interactive quiz game in Ruby that allows users to play quizzes on various topics. The game should provide multiple-choice questions, keep score, and display results at the end of each quiz.
require 'csv'

class Quiz
  attr_accessor :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
    
  end
end

def load_questions_from_csv(file_name)
  math = []

  CSV.foreach(file_name, headers: true) do |row|
    question = row['question']
    answer = row['answer']
    math << Quiz.new(question, answer)
   end
  math
end

math = load_questions_from_csv('math.csv')
#----in excel csv, ALT+ENTER for next line in one cell
# math = [
#   Quiz.new("What is 1 + 1?\n(a) 3\n(b) 2\n(c) 10", "b"),
#   Quiz.new("What is 2 x 3?\n(a) 23\n(b) 5\n(c) 6", "c"),
#   Quiz.new("What is 4 / 2?\n(a) 2\n(b) 6\n(c) 8", "a")
# ]
science = load_questions_from_csv('science.csv')
# science = [
#   Quiz.new("What is the color of the ocean?\n(a) yellow\n(b) blue\n(c) black", "b"),
#   Quiz.new("What is the color of an apple?\n(a) red\n(b) blue\n(c) yellow", "a"),
#   Quiz.new("Which state of matter is water?\n(a) gas\n(b) liquid\n(c) solid", "b")
# ]

topics = {
  "Math" => math,
  "Science" => science
}

def choose_topic(topics)
  puts "Select topic:"
  topics.each_with_index { |(topic), index| puts "#{index + 1}. #{topic}" }
  topic_number = gets.chomp.to_i
  selected_topic = topics.keys[topic_number - 1]
  selected_questions = topics[selected_topic]
  run_quiz(selected_questions) # another method inside
end

def run_quiz(questions) #placeholder for science and math array
  score = 0

   for item in questions #placeholder here
    puts item.question
    answer = gets.chomp.downcase

      while answer != "a" && answer != "b" && answer != "c"
      puts "Invalid input. Please try again."
      answer = gets.chomp.downcase
      end

      if answer == item.answer
      score += 1
      end
   end

  puts "Score is #{score}/#{questions.length}"
end


puts "Hello! Let's play a quiz! Would you like to start? yes/no"

loop do

	option = gets.chomp.downcase

	while option != "yes" && option != "no" 
      puts "Invalid input. Please try again."
      option = gets.chomp.downcase
   end

	case option
	when "yes"
		choose_topic(topics)
		puts "Would you like to continue? yes/no"
	else "no"
		exit
	end  
end