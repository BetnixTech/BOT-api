#import <Foundation/Foundation.h>
#import "BotDev.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BotDev *bot = [[BotDev alloc] init];
        
        [bot registerCommand:@"attack" withBlock:^NSString* (NSString* player, NSArray* args) {
            return [NSString stringWithFormat:@"%@ attacks!", player];
        }];
        
        [bot registerCommand:@"chat" withBlock:^NSString* (NSString* player, NSArray* args) {
            NSString *msg = [args componentsJoinedByString:@" "];
            NSString *resp = [bot aiResponse:msg];
            return [NSString stringWithFormat:@"%@ says: %@", player, resp];
        }];
        
        [bot onEvent:@"player_joined" block:^(NSArray *args) {
            NSLog(@"[EVENT] Welcome %@!", args[0]);
        }];
        
        [bot addPlayer:@"Alice"];
        [bot addPlayer:@"Bob"];
        
        NSLog(@"%@", [bot executeCommand:@"attack" forPlayer:@"Alice" args:@[]]);
        NSLog(@"%@", [bot executeCommand:@"chat" forPlayer:@"Bob" args:@[@"Hello!"]]);
    }
    return 0;
}
