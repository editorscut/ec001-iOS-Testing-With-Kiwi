#import "Kiwi.h"

SPEC_BEGIN(CalculatorStackTests)
describe(@"In our first Kiwi test", ^{
    context(@"a sample string", ^{
        NSString *greeting = @"Hi";//Hello, World!";
        it(@"should exist.", ^{
            [greeting shouldBeNil];
        });
        it(@"should be 'Hello, World!'.", ^{
            [[greeting should] equal:@"Hello, World!"];
        });
    });
});

SPEC_END