
from game_sim import game_loop, player_join
if __name__ == "__main__":
    # Add example players
    player_join("Alice")
    player_join("Bob")
    # Start game simulation
    game_loop()
