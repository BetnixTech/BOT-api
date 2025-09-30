#import "Player.h"

@implementation Player
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _level = 1;
        _inventory = [NSMutableArray array];
    }
    return self;
}
@end
