#import "RPNStack.h"
@interface RPNStack()
@property(nonatomic,retain) NSMutableArray *data;
@end

@implementation RPNStack
@synthesize data = _data;
- (id) init {
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return self;
}
- (void) push:(double)numberToPush {
    [self.data addObject:[NSNumber numberWithDouble:numberToPush]];
}
- (double)pop {
    double poppedValue = [self top];
    if (![self.data lastObject]) {
        [NSException raise:@"RPNEmptyStackPopException"
                    format:@"Pop was sent to an empty stack"];
        
    }
    [self.data removeLastObject];
    return poppedValue;
}
- (double)top {
    return [[self.data lastObject] doubleValue];
}
- (void) clear {
    [self.data removeAllObjects];
}
- (NSUInteger)count {
    return [self.data count];
}
@end
