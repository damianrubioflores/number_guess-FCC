#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=highscore -t --no-align -c"

echo -e "Enter your username:"
read USER

USERNAME=$($PSQL "SELECT username, games_played, best_game FROM usernames WHERE username='$USER'")

# if username is NOT on database
if [[ -z $USERNAME ]]
then
	# message of first time
	echo -e "Welcome, $USER! It looks like this is your first time here."
	GAMES=0
	BEST=999
	USERNAME=$($PSQL "INSERT INTO usernames(username, games_played, best_game) VALUES ('$USER', $GAMES, $BEST)")
  
# if user is on database
# message with data on username
else
  USERNAME=$($PSQL "SELECT username,games_played,best_game FROM usernames WHERE username='$USER'")  
	echo $USERNAME | while IFS=" |" read USER GAMES BEST
	do
		echo -e "Welcome back, $USER! You have played $GAMES games, and your best game took $BEST guesses."
	done
fi

# The game starts here
USERID=$($PSQL "SELECT user_id FROM usernames WHERE username='$USER'")
GAMES=$($PSQL "SELECT games_played FROM usernames WHERE user_id='$USERID'")
BEST=$($PSQL "SELECT best_game FROM usernames WHERE user_id='$USERID'")

echo -e "Welcome, $USER !"
echo -e "Guess the secret number between 1 and 1000:"
SECRET_NUMBER=$((1 + $RANDOM % 1000))
PLAYS=1
read GUESS

while [[ $SECRET_NUMBER != $GUESS ]]
do
	if [[ ! $GUESS =~ ^[0-9]+$ ]]
	then
		echo -e "That is not an integer, guess again:"
	elif [[ $SECRET_NUMBER < $GUESS ]]
	then
		echo -e "It's lower than that, guess again:"
	elif [[ $SECRET_NUMBER > $GUESS ]]
	then
		echo -e "It's higher than that, guess again:"
	fi
	((PLAYS++))
	read GUESS
done
((GAMES++))

USERNAME=$($PSQL "UPDATE usernames SET games_played=$GAMES WHERE user_id=$USERID")
if [[ $PLAYS < $BEST ]]
then
	USERNAME=$($PSQL "UPDATE usernames SET best_game=$PLAYS WHERE username='$USER'")
fi
echo -e "You guessed it in $PLAYS tries. The secret number was $SECRET_NUMBER. Nice job!"