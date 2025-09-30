#import "BotDev.h"
#import "Player.h"

@implementation BotDev

- (instancetype)init {
    self = [super init];
    if (self) {
        _players = [NSMutableDictionary dictionary];
        _events = [NSMutableDictionary dictionary];
        _commands = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addPlayer:(NSString*)name {
    if (![_players objectForKey:name]) {
        Player *p = [[Player alloc] initWithName:name];
        [_players setObject:p forKey:name];
        [self triggerEvent:@"player_joined" args:@[name]];
        [self log:[NSString stringWithFormat:@"Player %@ joined.", name]];
    }
}

- (Player*)getPlayer:(NSString*)name { return [_players objectForKey:name]; }

- (void)registerCommand:(NSString*)cmd withBlock:(id)block { [_commands setObject:block forKey:cmd]; }

- (NSString*)executeCommand:(NSString*)cmd forPlayer:(NSString*)player args:(NSArray*)args {
    id block = [_commands objectForKey:cmd];
    if (block) {
        NSString* (^commandBlock)(NSString*, NSArray*) = block;
        return commandBlock(player, args);
    }
    return [NSString stringWithFormat:@"Unknown command: %@", cmd];
}

- (void)onEvent:(NSString*)event block:(void (^)(NSArray* args))block {
    if (![_events objectForKey:event]) { _events[event] = [NSMutableArray array]; }
    [_events[event] addObject:block];
}

- (void)triggerEvent:(NSString*)event args:(NSArray*)args {
    for (void (^block)(NSArray* args) in _events[event]) { block(args); }
}

- (NSString*)aiResponse:(NSString*)prompt {
    NSArray *responses = @[@"Attack now!", @"Defend your base!", @"Collect the item!", @"Hello adventurer!", @"You found a rare item!", @"Level up!"];
    int index = arc4random_uniform((uint32_t)[responses count]);
    return responses[index];
}

- (void)log:(NSString*)message { NSLog(@"[LOG] %@", message); }

@end
