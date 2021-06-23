import random
import matplotlib.pyplot as plt


def rolldice():

    dice = random.randint(1, 100)

    if dice <= 51:
        return False
    elif dice > 51 & dice <= 100:
        return True


def play(total_funds, wager_amount, total_plays):

    # Create empty lists for:
    # 1.Play_number and
    # 2.Funds available
    # 3.Final Fund
    Play_num = []
    Funds = []  # Start with play number 1
    play = 1
# If number of plays is less than the max number of plays we have set
    while play < total_plays:
        # If we win
        if rolldice():
            # Add the money to our funds
            total_funds = total_funds + wager_amount
            # Append the play number
            Play_num.append(play)
            # Append the new fund amount
            Funds.append(total_funds)
        # If the house wins
        else:
            # Add the money to our funds
            total_funds = total_funds - wager_amount
            # Append the play number
            Play_num.append(play)
            # Append the new fund amount
            Funds.append(total_funds)

        # Increase the play number by 1
        play = play + 1
        # Line plot of funds over time
    plt.plot(Play_num, Funds)
    Final_funds.append(Funds[-1])
    return(Final_funds)

# Call the function to simulate the plays and calculate the remaining
# funds of the player after all the bets
# Intialize the scenario number to 1


x = 1
# Create a list for calculating final funds
Final_funds = []

while x <= 100:
    ending_fund = play(10000, 100, 100000)
    x = x + 1
    # Plot the line plot of "Account Value" vs "The number of plays"
plt.ylabel('Player Money in $')
plt.xlabel('Number of bets')
plt.show()   # Print the money the player ends with
print("The player starts the game with $10,000 and ends with $" + str(sum(ending_fund)/len(ending_fund)))
