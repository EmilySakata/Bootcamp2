#homework 2;  hangman.py
import re

#initial veriable definition

balance = 50
guess = 7
game_answer= ["ape" , "dog", "bird"]
i= 0
player_array = []
win = 0
lose = 0
input_str =""

# print current balance
def status():
	print("you have $"+ str(balance))
	print("guesses left: "+ str(guess))
	print("guessed letters: " + str(player_array))

# print the guessed status 
def printWord(word):
	global output 
	output = ""
	for let in word:
	  	if let in player_array:
	   		output += let 
	  	else:
	   		output += ' _ '
	return output

#play the game again
def play_again ():
	input_str_again = input ("want to play again ? Type y or n.")
	if  input_str_again == "y":
		global i
		global guess
		global player_array
		i=i+1
		guess = 8
		player_array  = []
	elif  input_str_again == "n":
		quit()

# Initial balance

print("you have $ " + str(balance))
print("guesses left: " + str(guess))
for i in range(0 ,2):
	

	#play the game1	
	while guess >0 and balance >0 and win + lose <3:
#call player input as a input_str 
		input_str = input ("Guess a letter.")

	# player guess the letter incorrectly
		if input_str not in game_answer[i] and input_str not in player_array:
			print("you did not get it")
			player_array = player_array + [input_str]
			print(printWord(game_answer[i]))
			guess -= 1
			balance -= 5
			status()

	# player guessed the letter right		
		elif  input_str  in game_answer[i] and input_str  not in player_array:
			print("You got it")
			player_array = player_array + [input_str]
			print(printWord(game_answer[i]))
			balance += 5
			status()

	# input_str is already guessed by the player
		elif input_str in player_array:
			print("you already guessed:" + str(input_str))

	# If the player does not have enough balance to play, terminate the game
		if balance == 0:
			print("you have $0")
			print("you do not have enough money to play this game.")	
			print ("you have won "+str(win)+ " times")
			print ("you have lost "+str(lose)+ " times")
			quit()
# If player guessed all letters, print " You won!" and ask if the player wants to play it again
		if "_" not in printWord(game_answer[i]) and win +lose <3:
			print("You Won!")
			win = win+1
			play_again ()

	# If player guess 7 times and have not completed the game, print " you lost"
		if guess == 0:
			print("you lost")
			lose = lose+1
			play_again ()

print ("you have won "+str(win)+ " times")
print ("you have lost "+str(lose)+ " times")


