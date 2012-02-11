#import <Foundation/Foundation.h>

@interface RPNCalculator : NSObject
- (void) enter:(double) enteredNumber;
- (void) clear;
- (double) moveRegistersDown;

- (double) squareRoot;
- (double) square;
- (double) changeSign;
- (double) reciprocal;

- (double) add;
- (double) subtract;
- (double) multiply;
- (double) divide;
@end
