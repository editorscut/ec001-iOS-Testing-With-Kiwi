#import "Kiwi.h"
#import "RPNCalculator.h"

SPEC_BEGIN(RPNBinaryOperationsSpec)
describe(@"Calculator", ^{    
    context(@"with the numbers 60 and 5 entered", ^{
        RPNCalculator *calculator = [[RPNCalculator alloc] init];        
        beforeEach(^{
            [calculator enter:60];
            [calculator enter:5];
        });
        afterEach(^{ 
            [calculator clear];
        });
        it(@"contains exactly the two elements 60 and 5", ^{
            [[theValue([calculator moveRegistersDown]) should] equal:5 withDelta:.01];
            [[theValue([calculator moveRegistersDown]) should] equal:60 withDelta:.01];
            [[theBlock(^{[calculator moveRegistersDown];}) should] raise];
        });
        it(@"returns 65 as the sum", ^{
            [[theValue([calculator add]) should] equal:65 withDelta:.01];
        });
        it(@"returns 55 as the difference", ^{
            [[theValue([calculator subtract]) should] equal:55 withDelta:.01];
        });
        it(@"returns 300 as the product", ^{
            [[theValue([calculator multiply]) should] equal:300 withDelta:.01];
        });
        it(@"returns 12 as the quotient", ^{
            [[theValue([calculator divide]) should] equal:12 withDelta:.001];
        });
        it(@"reports INFINITY when dividing by zero", ^{
            [calculator enter:0];
            [[theValue([calculator divide]) should] equal:theValue(INFINITY)];
        });
    });
});
SPEC_END