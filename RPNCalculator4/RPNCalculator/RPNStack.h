#import <Foundation/Foundation.h>

@interface RPNStack : NSObject

- (void)push:(double) numberToPush;
- (double)pop;
- (double)top;
- (void)clear;
@end
