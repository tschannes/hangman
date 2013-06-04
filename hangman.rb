array_of_words = %w(cat dog fox bus moon)
random_index = rand(array_of_words.length)
chosen_word = array_of_words[random_index]
target = chosen_word.split("")
hidden_array = []
guessed_letters =[]

(target.length).times do
	hidden_array << "_ " 
end

puts hidden_array.join("")
number_of_guesses = 8 
8.times do |guess|
	break if hidden_array == target
	
	puts "Please enter your guess!"
	puts "You've already tried: \"#{guessed_letters.join(", ")}\""
	puts "You've got #{number_of_guesses} trials left."
	input = gets.chomp
	
	until input.length == 1
		puts "Please enter a single letter!"
		input = gets.chomp
	end

	flag=false
	for i in (0..(target.size - 1)) do
		if input == target[i]
			hidden_array[i] = target[i]
			flag=true
		end
	end

	if flag ==false
		puts "NOPE, try again!"
		number_of_guesses -= 1
		guessed_letters << input
	end

	puts hidden_array.join("")
end
if number_of_guesses != 0
	puts "You won!!"
else
	puts "You lost!"
end
