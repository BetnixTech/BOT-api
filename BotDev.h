#import <Foundation/Foundation.h>
#import "Player.h"

@interface BotDev : NSObject
@property (nonatomic, strong) NSMutableDictionary<NSString*, Player*> *players;
@property (nonatomic, strong) NSMutableDictionary<NSString*, NSMutableArray*> *events;
@property (nonatomic, strong) NSMutableDictionary<NSString*, id> *commands;

- (void)addPlayer:(NSString*)name;
- (Player*)getPlayer:(NSString*)name;
- (void)registerCommand:(NSString*)cmd withBlock:(id)block;
- (NSString*)executeCommand:(NSString*)cmd forPlayer:(NSString*)player args:(NSArray*)args;
- (void)onEvent:(NSString*)event block:(void (^)(NSArray* args))block;
- (void)triggerEvent:(NSString*)event args:(NSArray*)args;
- (NSString*)aiResponse:(NSString*)prompt;
- (void)log:(NSString*)message;
@end
