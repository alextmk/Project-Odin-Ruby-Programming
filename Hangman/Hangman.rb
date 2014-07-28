require "./Dictionary"
require "yaml"

class Hangman
	def initialize 
		#class variables
		@@skeleton=["O","|","|","\\","/","/","\\"] #all hangman have basic skeleton aprts

		#word variables, keeping track of answer/guesses
		@user_guess=[] #Already guessed letters
		@guess=nil #
		@answer_word=Dictionary.new(5,12).get_a_word.downcase #the word that user is trying to guess, dictionary class will randomly pick a word 5 to 12 long using dictionaryfile
		@current=[] #current standing of all the words
		@answer_word.length.times do |i|
			@current<<"_"
		end


		#variables related to game variables
		@current_turn=0 #the current turn that the user is on
		@user_selection=nil #The selection user makes from the main menu
		
		#skeleton variables
		@body=[" "," "," "," "," "," "," "] #variable to hold body
		@skeleton_base=%Q(|-------------|          Total Letters=#{@answer_word.length}\n|             |          Lives Left=#{7-@current_turn}\n|             #{@body[0]}\n|            #{@body[3]}#{@body[1]}#{@body[4]}\n|             #{@body[2]}\n|            #{@body[5]} #{@body[6]}\n|\n|_________________)
	end

	def menu
		welcome_selection
		while(@user_selection!=1&&@user_selection!=2)
			if(@user_selection==3)
				system('clear')
				puts "----------------------------------------------------------------------"
				about_message
				puts "----------------------------------------------------------------------"
				welcome_selection
				puts "----------------------------------------------------------------------"
			elsif(@user_selection==4)
				abort("You've quit the game!")
			end
		end
		if(@user_selection==1)
			system('clear')
			puts "----------------------------------------------------------------------"
			puts @skeleton_base
			puts ""
			puts display_current
		else
			#load saved game here
			load_game
		end
	end
	def continue_turn
		system('clear')
		puts @skeleton_base #draw skeleton
		puts ""
		puts display_current #show current 
		take_turn
	end
	def take_turn #takes turn until game is over
		while(!check_win||!check_loss) #while haven't won or haven't lost
			user_input #takes user's guess
			check_letter(@guess) #update current/skeleton parts as needed
			if(check_win) #check win
				abort(win_message)
			elsif (check_loss) #check loss
				add_body_part
				puts @skeleton_base
				abort(lose_message)
			else
				puts @skeleton_base #draw skeleton
				puts ""
				puts display_current #show current 
			end
		end
	end

	private

		def save_game
			save_object("./save.txt",self)
		end

		def load_game
			saved=load_object("./save.txt")
			saved.continue_turn
		end

		def save_object(filename,file_to_save)
			File.open(filename, "w") do |file|
				file.write(YAML::dump(file_to_save))
			end
		end

		def load_object(filename)
			return YAML::load(File.read(filename))
		end

		def about_message
			puts "This is a game where a word between length of 5 - 12 will be picked and you'll have to guess the word. Everytime you guess incorrectly, the hangman will gain another part to his body, once the hangman is fully formed(7 lives), you'll have lost the game"
		end

		def welcome_selection #welcome screen, user can select from between options 1-4
			puts "----------------------------------------------------------------------"
			puts "Welcome to Hangman!, please select from the following options\n1: New Game\n2: Last Saved Game\n3: About\n4: Quit Game"
			puts "----------------------------------------------------------------------"
			@user_selection=gets.chomp
			while(@user_selection.length>1||@user_selection.split("").any? {|i| i=~/[^1-4]/})
				puts "Not a valid choice, please select another choice. \n1: New Game\n2: Last Saved Game\n3: About\n4: Quit Game"
				@user_selection=gets.chomp
			end
			@user_selection=@user_selection.to_i
		end


		def user_input #sets the instance variable @guess to take a new guess
			puts "Please guess a letter:"
			@guess=gets.downcase.chomp
			if(@guess=="save")
				#Save the game File, give a time with saves
				save_game
				abort("You've saved the game file")
			elsif(@guess=="quit")
				abort("You've selected to quit the game")
			end
			while(@guess.length>1||@guess.split("").any? {|i| i=~/[^a-zA-Z]/}||@user_guess.include?(@guess)) # if guess isn't just 1 letter or anything else
				#take another guess here
				puts "Invalid input/You've already guessed that, please guess a letter"
				@guess=gets.downcase.chomp
				if(@guess=="save")
					#Save the game File, give a time with saves
					save_game
					abort("You've saved the game file")
				elsif(@guess=="quit")
					abort("You've selected to quit the game")
				end
			end
			@user_guess<<@guess
		end


		def check_letter(letter) #checks if the guess is correct, if it's right, update it on @current, if not add a body part
			if (!@answer_word.split("").any? do |i|
					i==letter
					end)
				puts "Sorry #{letter} is not in the word"
				add_body_part
				@current_turn+=1
			end

			@answer_word.split("").each_with_index do |item, i|
				if(item==letter)
					@current[i]=letter
				end
			end
		end

		def check_win #returns true if word has been solved
			return true if @current.join("")==@answer_word
			return false
		end

		def check_loss #returns true if lost 
			return true if @current_turn==7
			return false
		end

		def win_message #message shown when the user guesses the word
			return "Nice! You've got the word, it is indeed \"#{@answer_word}\""
		end

		def lose_message #message displayed when the user loses before guessing the word
			return "Aww, you died before you could determine the word, it was \"#{@answer_word}\""
		end

		def display_current #every turn this needs to be shown
			return "Currently: #{@current.join(" ")} ; Guessed letters: #{@user_guess.join(",")}"
		end

		def add_body_part #add a body part to the skeleton
			@body[@current_turn]=@@skeleton[@current_turn]
			@skeleton_base=%Q(|-------------|          Total Letters=#{@answer_word.length}\n|             |          Lives Left=#{6-@current_turn}\n|             #{@body[0]}\n|            #{@body[3]}#{@body[1]}#{@body[4]}\n|             #{@body[2]}\n|            #{@body[5]} #{@body[6]}\n|\n|_________________)
		end

end