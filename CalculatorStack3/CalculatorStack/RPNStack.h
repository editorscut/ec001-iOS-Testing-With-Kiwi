#import <Foundation/Foundation.h>

@interface RPNStack : NSObject

- (void)push:(double) numberToPush;
- (double)top;

@end
