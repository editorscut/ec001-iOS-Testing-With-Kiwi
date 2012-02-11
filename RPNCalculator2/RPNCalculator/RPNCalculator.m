#import "RPNCalculator.h"
#import "RPNStack.h"

@interface RPNCalculator()
@property(strong) RPNStack *stack;
@end


@implementation RPNCalculator
@synthesize stack = _stack;

- (id) init {
    if (self = [super init]) {
        _stack = [[RPNStack alloc] init];
    }
    return self;
}
#pragma mark - Calculator utilities
- (void) enter:(double) enteredNumber{
    [self.stack push:enteredNumber];
}
- (void) clear{
    [self.stack clear];
}
- (double) moveRegistersDown {
    return [self.stack pop];
}
#pragma mark - Operator utilities

- (double)results:(double) value {
    [self.stack push:value];
    return value;
}

- (double) performUnaryOperation:(double (^)(double a)) calculation {
    return [self results:calculation([self.stack pop])];
}

- (double) performBinaryOperation:(double (^) (double a, double b)) calculation {
    return [self results:calculation([self.stack pop], [self.stack pop])];
}

#pragma mark - Unary operators
- (double) squareRoot {
    return [self performUnaryOperation:^double(double a) {
        return sqrt(a);
    }];
}
- (double) square {
    return [self performUnaryOperation:^double(double a) {
        return a*a;
    }];
}
- (double) changeSign {
    return [self performUnaryOperation:^double(double a) {
        return -a;
    }];
}
- (double) reciprocal {
    return [self performUnaryOperation:^double(double a) {
        return 1/a;
    }];
}
#pragma mark - Binary operators
- (double) add {
    return [self performBinaryOperation:^double(double a, double b) {
        return b + a;
    }];
}
- (double) subtract {
    return [self performBinaryOperation:^double(double a, double b) {
        return b - a;
    }];
}
- (double) multiply {
    return [self performBinaryOperation:^double(double a, double b) {
        return b * a;
    }];
}
- (double) divide {
    return [self performBinaryOperation:^double(double a, double b) {
        return b / a;
    }];
}

@end
