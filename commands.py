
from ai_module import get_ai_response
class CommandHandler:
    def __init__(self):
        self.commands = {"attack": self.attack, "defend": self.defend, "chat": self.chat}
    def handle(self, cmd, player):
        func = self.commands.get(cmd.split()[0], self.unknown)
        return func(cmd, player)
    def attack(self, cmd, player):
        return f"{player} attacks!"
    def defend(self, cmd, player):
        return f"{player} defends!"
    def chat(self, cmd, player):
        prompt = ' '.join(cmd.split()[1:])
        return f"{player} says: {get_ai_response(prompt)}"
    def unknown(self, cmd, player):
        return "Unknown command."
