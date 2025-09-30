
# Offline AI using simple rule-based + dummy neural responses
import random
def get_ai_response(prompt):
    responses = [
        "Attack now!", "Defend your base!", "Collect the item!", "Hello adventurer!",
        "You found a rare item!", "Level up!"
    ]
    return random.choice(responses)
