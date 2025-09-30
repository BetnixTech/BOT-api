
from player import Player
from commands import CommandHandler
from events import EventHandler

players = []
commands = CommandHandler()
events = EventHandler()

def player_join(name):
    p = Player(name)
    players.append(p)
    events.trigger('player_joined', p)
    return p

def game_loop():
    print("Game simulation started. Type 'exit' to quit.")
    while True:
        inp = input("Enter player command: ")
        if inp == 'exit': break
        if ' ' in inp:
            player_name, cmd = inp.split(' ', 1)
            response = commands.handle(cmd, player_name)
            print(response)
        else:
            print("Format: <player_name> <command>")
