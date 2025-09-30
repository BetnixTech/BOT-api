#import <Foundation/Foundation.h>

@interface Player : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int level;
@property (nonatomic, strong) NSMutableArray<NSString *> *inventory;
- (instancetype)initWithName:(NSString *)name;
@end
