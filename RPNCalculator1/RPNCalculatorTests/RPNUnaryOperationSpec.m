#import "Kiwi.h"
#import "RPNCalculator.h"

SPEC_BEGIN(RPNUnaryOperationsSpec)
describe(@"Calculator", ^{    
    context(@"with the number 25 entered", ^{
        RPNCalculator *calculator = [[RPNCalculator alloc] init];        
        beforeEach(^{
            [calculator enter:25];
        });
        afterEach(^{ 
            [calculator clear];
        });
        it(@"should contain exactly one element", ^{
            [[theValue([calculator moveRegistersDown]) should] equal:25 
                                                           withDelta:.01];
            [[theBlock(^{[calculator moveRegistersDown];}) should] raiseWithName:@"RPNEmptyStackPopException"];
        });
        it(@"has square root 5.", ^{
            [[theValue([calculator squareRoot]) should] equal:5 withDelta:.001];
        });
        it(@"has square 625.", ^{
            [[theValue([calculator square]) should] equal:625 withDelta:.01];
        });
        it(@"has opposite -25.", ^{
            [[theValue([calculator changeSign]) should] equal:-25 withDelta:.01];
        });
        it(@"has reciprocal .04.", ^{
            [[theValue([calculator reciprocal]) should] equal:.04 withDelta:.001];
        });
        it(@"reports NAN for the square root of a negative", ^{
            [calculator changeSign];
            [[theValue([calculator squareRoot]) should] equal:theValue(NAN)];
        });
        it(@"returns INFINITY for the reciprocal of 0", ^{ 
            [calculator enter:0];
            [[theValue([calculator reciprocal]) should] equal:theValue(INFINITY)];
        });
    });
});
SPEC_END