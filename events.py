
class EventHandler:
    def __init__(self):
        self.handlers = {}
    def trigger(self, event_name, *args, **kwargs):
        if event_name in self.handlers:
            for func in self.handlers[event_name]:
                func(*args, **kwargs)
    def on(self, event_name, func):
        if event_name not in self.handlers:
            self.handlers[event_name] = []
        self.handlers[event_name].append(func)
