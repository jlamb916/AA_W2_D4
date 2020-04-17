Board
The Board class is responsible for adding a player's marks, checking for winners, and printing the game board. A board instance must have an attribute to represent the grid. For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.

Board#initialize
A Board instance must have an instance variable to represent the game grid. For now, Board#initialize does not need to accept any arguments. Initialize the grid so that all positions are empty; this means that every position should contain an underscore ('_').

Board#valid?(position)
This method should return a boolean indicating whether or not the specified position is valid for the board, meaning the position is not "out of bounds."

Board#empty?(position)
This method should return a boolean indicating whether or not the specified position does not contain a player's mark.

Board#place_mark(position, mark)
This method should assign the given mark to the specified position of the grid. It should raise an error when the position is not #valid? or not #empty?.
######################
Board#print
This method should simply print out the board and all of the marks that have been placed on it. Feel free to style the printing as much as you'd like, but be sure to print out each row of the board on a new line. This will help us visualize the board better as we debug or even play the game!

Board#win_row?(mark)
This method should return a boolean indicating whether or not the given mark has completely filled up any row of the grid.

Board#win_col?(mark)
This method should return a boolean indicating whether or not the given mark has completely filled up any column of the grid.

Board#win_diagonal?(mark)
This method should return a boolean indicating whether or not the given mark has completely filled up either diagonal of the grid.

Board#win?(mark)
This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal.

Board#empty_positions?
This method should return a boolean indicating whether or not there is at least one empty position on the grid.

------------------------------------------------------------
HumanPlayer
The HumanPlayer class is responsible for holding information about the user and prompting them to enter a position for gameplay.

HumanPlayer#initialize(mark_value)
We'll allow a player to use any mark they like, so an instance of HumanPlayer should have a instance variable to store their mark. The value of this mark should be provided as an argument when creating a new player. Consider adding a getter method for the player's mark, this may be useful later!

HumanPlayer#get_position
This method should prompt and allow the user to enter a valid row col position. We recommend that you ask the user to enter the position as two numbers with a space between them. Your method should return their entered position as an array of the form [row, col] so that it is compatible with the design of our previous Board methods. For usability, raise an error when they fail to enter a position in the specified format, such as if they only enter a single number, use letters, or have too many spaces.

No need to verify if the position they entered is a valid position in this class. That validation requires knowledge of the board and we want to keep our concerns separated. Besides, you previously implemented that logic in Board#valid? and Board#empty?.

It's also helpful if you state the player's mark when asking them to enter a move, so we know whose turn it is.

Game
The Game class will be the main class that houses the instances of Board and HumanPlayer required for gameplay. It will be responsible for passing data between the board and players. It will also serve to contain the main game loop.

Be sure to require your board.rb and human_player.rb files into game.rb.

Game#initialize(player_1_mark, player_2_mark)
An instance of Game should have instance variables for player one, player two, and the board. Design the #initialize method to accept the mark values to be used for the players.

You should also initialize an instance variable to contain the current player. By default, player one should begin as the current player.

Game#switch_turn
This method should set the current player to the other player. Calling this method repeatedly should switch the current player back and forth between the two players.

This method is critical for gameplay so be sure to test it in pry. Here is how our switching mechanic performs:

Game#play
This method will contain the main game loop. Here is some psuedocode for the loop:

while there exists empty positions on the board
print the board
get a position from the current player
place their mark at that position of the board
check if that user has won
if they win, print out a 'victory' message saying who won and return to end the game
otherwise they did not win, so switch turns
if we finish the while loop without returning, that means there are no more empty positions on the board and noone has won, so print a 'draw' message