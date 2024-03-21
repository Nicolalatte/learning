#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

  #Insert unique team names into teams table
  do
  if [[ $WINNER != "winner" ]]; then
    # get major_id
    team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $team_id ]]
    then
      # insert major
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Added to teams, $WINNER
      fi

      # get new major_id
      team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]; then
    # get major_id
    team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if not found
    if [[ -z $team_id ]]
    then
      # insert major
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      #if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      #then
      #  echo Added to teams, $OPPONENT
      #fi

      # get new major_id
      team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
  
  if [[ $YEAR == "year" ]]; then
    continue
  fi

  #Retrieve winner-ID from teams
  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  if [[ -z $winner_id ]]; then
    echo "Error: Winner '$WINNER' not found in the teams table"
    continue
  fi

  #Retrive opponent-ID from teams table
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  if [[ -z $opponent_id ]]; then
    echo "Error: Opponent '$OPPONENT' not found in the teams table"
    continue
  fi

  #Insert into games table
  insert_result=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$YEAR', '$ROUND', '$winner_id', '$opponent_id', '$WINNER_GOALS', '$OPPONENT_GOALS')")
  if [[ insert_result == "INSERT 0 1" ]]; then
    echo "Inserted game data for $YEAR $ROUND: $WINNER vs $OPPONENT"
  fi
  done
