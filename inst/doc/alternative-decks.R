## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(mmcards)

## -----------------------------------------------------------------------------
# Define the Players
p1 <- NULL
p2 <- NULL

# Create a shuffled anonymous deck of 10 cards using a random number seed for reproducibility
game_deck <- shuffle_deck(deck_of_cards = function(x){rnorm(10, 0, 5)},
                          seed = 147)

# Deal a card to each player
game_deck <- deal_card(game_deck)
p1 <- game_deck$dealt_card

game_deck <- deal_card(game_deck)
p2 <- game_deck$dealt_card

# Display the cards and determine the winner
paste("p1 has:", p1$card, "with a value of", p1$value)
paste("p2 has:", p2$card, "with a value of", p2$value)
paste0("The winner is: ", ifelse(abs(p1$value) < abs(p2$value), "p1", "p2"))

# Here are the remaining 8 cards in the deck
print(game_deck$updated_deck)

## -----------------------------------------------------------------------------
# Define the Players
p1 <- NULL
p2 <- NULL

# Create a shuffled interleaved deck of 10 cards using a random number seed for reproducibility
game_deck <- shuffle_deck(deck_of_cards = function(x){list(rnorm(5, 0, 5),
                                                           rnorm(5, 0, 3))},
                          seed = 157)

# Deal a card to each player
game_deck <- deal_card(game_deck)
p1 <- game_deck$dealt_card

game_deck <- deal_card(game_deck)
p2 <- game_deck$dealt_card

# Display the cards and determine the winner
paste("p1 has:", p1$card, "with a value of", p1$value)
paste("p2 has:", p2$card, "with a value of", p2$value)
paste0("The winner is: ", ifelse(abs(p1$value) < abs(p2$value), "p1", "p2"))

# Here are the remaining 8 cards in the deck
print(game_deck$updated_deck)

## -----------------------------------------------------------------------------
# Define the hands
LH <- NULL
RH <- NULL

# Create a shuffled paired deck of 20 cards using a random number seed for reproducibility
game_deck <- shuffle_deck(deck_of_cards = function(x){list(rpois(10, 30),
                                                           rnorm(10, 40))},
                          seed = 232,
                          paired = TRUE)


# For the student whose cards came out on top, get the hang time for each hand
game_deck <- deal_card(game_deck)
LH <- game_deck$dealt_card

game_deck <- deal_card(game_deck)
RH <- game_deck$dealt_card

# Display the cards and determine which hand was stronger
paste("This student's left hand card is:",
      LH$card, "with a value of", LH$value)
paste("This student's right hand card is:", RH$card, "with a value of", RH$value)
paste0("Did this student hang for longer with left hand?: ",
       ifelse(LH$value > RH$value, "Yes", "No"))

# Here are the remaining students' hang times
print(game_deck$updated_deck)

