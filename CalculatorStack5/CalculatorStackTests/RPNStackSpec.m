#import "Kiwi.h"
#import "RPNStack.h"

SPEC_BEGIN(RPNStackSpec)

describe(@"The stack", ^{
    RPNStack *stack = [[RPNStack alloc] init];
    afterEach(^{
        [stack clear];
    });
    context(@"when created", ^{
        it(@"is not nil.", ^{
            [stack shouldNotBeNil];
        });
        it(@"allows me to add a double to it.", ^{
            [stack push:5.3];
            [[stack should] haveCountOf:1];
            [[theValue([stack top]) should] equal:5.3 withDelta:.001];
        });
        it(@"is empty", ^{
            [[stack should] beEmpty];
        });
    });
    context(@"after pushing 4.7 on an empty stack", ^{
        beforeEach(^{
            [stack push:4.7];
        });
        it(@"has exactly one element.", ^{
            [[stack should] haveCountOf:1];
        });
        it(@"has 4.7 as top.", ^{
            [[theValue([stack top]) should] equal:4.7 withDelta:.001];
        });
    });
});
SPEC_END
