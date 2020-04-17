Version 3: Rise of the machines
Make a copy of your entire tic_tac_toe_v2 directory and rename it tic_tac_toe_v3. Open the version 3 in your editor and terminal so we can refactor it to support more features. This will be our new working directory.

Our goal for this version is to implement a simple ComputerPlayer class that will play randomly. We will also add some improved error handling for our existing HumanPlayers.

Let's begin by adding a new file in our working directory to house ComputerPlayer:

Refactoring for random positions
Our ComputerPlayer artificial intelligence will be naive. When it is their turn, a computer will play a random position on the board. However, we'll want ensure that the computers will choose a position that is legal according to Board#empty? and Board#valid?. To implement this we, could just continually "guess and check" random positions until a legal position is stumbled upon, but this is a rather wasteful strategy. Instead, it would be much more wise to provide a list of legal positions to the ComputerPlayer from which they may randomly select.

Here is where we must make a design decision founded on object oriented principles. We should try our best to keep all board and position related logic inside of Board. Although our new major feature is ComputerPlayer, it is apparent that the Board class also needs to provide additional information for a ComputerPlayer to consume.

Board#legal_positions
This method should return an array containing all positions of the board that are legal to place a new mark on. That is, the returned positions should not already contain a mark and also be "in-bounds" on the grid.

ComputerPlayer#initialize
An instance of ComputerPlayer should have the same interface as a HumanPlayer. This means that both classes should have the same method names, but may implement these methods using different logic. Having a consistent interface for all types of players will allow us to use computers and humans interchangeably in a game with no annoying side-effects. The #initialize for a computer should be identical to that of a human.

The programming paradigm we leverage here is known as duck typing. If an object walks like a duck and quacks like a duck, then we can use it as a duck for all intents and purposes. In our game, we have duck typed HumanPlayer and ComputerPlayer.

HumanPlayer#get_position(legal_positions)
Refactor this method to accept an array of positions as an argument. If the user enters a position that is not inside of the array argument, tell them that their choice was illegal and prompt them to enter another. This method should continue to prompt the user until they make a legal choice.


Game#initialize
Refactor this method to accept an option hash instead of an arbitrary number of marks (we previously implemented that in version 2). A hash is a great choice here because we now need to communicate two details per player: their mark and whether they are human or computer. We also have the upshot of hash keys necessarily being unique. This is convenient because for proper gameplay we must have unique marks among the players!

Assume that the keys of the hash are the marks and the values are booleans. Interpret false as a human and true as a computer. The order of players in the hash should dictate the order that they take their turns. For example, the following game would entail three players of X (human), Y (computer), and Z (human) playing on a 4 by 4 board:

Game#play
Only one more refactor and we'll have our final product! Refactor this method slightly to account for our new argument required for #get_position. That is, be sure to pass in the board's legal positions for the player to choose from.

That's it. Play some diverse games with computers and humans to test your work. You've done some amazing object oriented programming if you've gotten to this point. Sit back, relax, and reward yourself by running this snippet in pry:

