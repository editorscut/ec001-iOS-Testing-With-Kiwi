#import "Kiwi.h"
#import "RPNStack.h"

SPEC_BEGIN(RPNStackSpec)

describe(@"The stack", ^{
    context(@"when created", ^{
        RPNStack *stack = [[RPNStack alloc] init];
        it(@"is not nil.", ^{
            [stack shouldNotBeNil];
        });
        it(@"is empty", ^{
            [[stack should] beEmpty];
        });
        it(@"allows me to add a double to it.", ^{
            [stack push:5.3];
            [[stack should] haveCountOf:1];
            [[theValue([stack top]) should] equal:5.3 withDelta:.001];
        });
    });
});
SPEC_END
