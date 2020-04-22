
Card.
    Value (uppercase Chars)
    Up or down?
    
    #hide
        - hide card
    #reveal
        - reveal card
    #to_s
    #==

Board. 2D array

    #populate should fill the board with a set of shuffled  Card pairs
    #render should print out a representation of the Board's current state
    #won? should return true if all cards have been revealed.
    #reveal should reveal a Card at guessed_pos (unless it's already face-up, in which case the method should do nothing). It should also return the value of the card it revealed (you'll see why later).


Game.
    #playturn
        - get user input
        - check if cards are a match
            - if yes reveal cards
            - if no hide cards
    
    # win?
        - when no cards hidden
    #lose?
        - when no guesses ramain
    #game_over?
        - when either win? or lose? are true
