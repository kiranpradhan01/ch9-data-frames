# Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)
points_scored <- c(9,12,27,46)

# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season
points_against <- c(17,9,33,18)

# Combine your two vectors into a dataframe called `games`
games <- data.frame(points_scored, points_against)
colnames(games) <- c("Seahawks", "Other")

# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!
games$diff <- games$Seahawks - games$Other
# how to remove column???
games$Difference <- NULL

# Create a new column "won" which is TRUE if the Seahawks won the game
games$won <- games$diff > 0

# Create a vector of the opponent names corresponding to the games played
opp_names <- c("Packers","49ers","Titans", "Colts")

# Assign your dataframe rownames of their opponents
rownames(games) <- opp_names

# View your data frame to see how it has changed!
View(games)
