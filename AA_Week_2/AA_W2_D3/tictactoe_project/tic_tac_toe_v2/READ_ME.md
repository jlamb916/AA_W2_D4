Version 2: Make it scalable

Our goal for this version is to make the game scale on two fronts:

support a dynamic board size
support more than two players

Board#initialize
Refactor this method to accept a number argument, n. The grid should be set to a 2-dimensional array with size 'n x n', instead of '3 x 3'. It's worth noting that the grid will always be a square (meaning its height is equal to its width). This will somewhat simplify things as we refactor our other methods.

Consider refactoring these critical board methods if they contain any hardcoded values:

Game#initialize
Refactor this method to also accept a number for the board size as the first argument.

That should be all we need to refactor, since we designed our version 1 to avoid as much coupling to Board as possible. However, take a moment to scan the rest of your Game and HumanPlayer class to be sure.

Use pry to play a few games of varying size to completion before continuing further.

Number of players refactor
Adding support for any number of players should require a decent refactor of the Game class, but no major changes to HumanPlayer. The only logic that should change is how we decide which player should move, but the capabilities of any single player remains unchanged.

Game#initialize
An instance of Game will now need to track an array of many players instead of just two. Make this an instance variable. Allow your #initialize to accept any number of mark values. The number of marks passed to #initialize will decide how many players are in the game.



