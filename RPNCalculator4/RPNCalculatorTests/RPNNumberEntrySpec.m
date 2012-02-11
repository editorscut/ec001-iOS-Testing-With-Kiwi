#import "Kiwi.h"
#import "RPNViewController.h"

@interface RPNViewController(NumberEntryTesting)
@property (weak, nonatomic) IBOutlet UILabel *display;
- (void)clearDisplay;
- (IBAction)userDidPressNumber:(UIButton *)sender;
@end

SPEC_BEGIN(RPNNumberEntrySpec)

UIButton * (^buttonWithTitle)(NSString * name)  = ^UIButton *(NSString *name) {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:name
            forState:UIControlStateNormal];
    return button;
};
RPNViewController * (^calculatorVC)(void) = ^RPNViewController * (void) {
    RPNViewController *tempVC = [[RPNViewController alloc]init ];
    UILabel *label = [[UILabel alloc] init];
    [tempVC.view addSubview:label];
    tempVC.display = label;
    return tempVC;
};

describe(@"Calculator View Controller", ^{
    RPNViewController *calcVC = calculatorVC();
    UIButton *numberThreeButton = buttonWithTitle(@"3");
    UIButton *numberFiveButton = buttonWithTitle(@"5");
    UIButton *decimalPointButton = buttonWithTitle(@".");
    beforeEach(^{
        [calcVC clearDisplay];
    }); 
    context(@"when the display is blank", ^{
        it(@"displays 3 after the 3 button is pressed.", ^{
            [calcVC userDidPressNumber:numberThreeButton];
            [[calcVC.display shouldNot] beNil];
            [[calcVC.display.text should] equal:@"3"];
        });
        it(@"displays 35 after the 3 and 5 buttons are pressed.", ^{
            [calcVC userDidPressNumber:numberThreeButton];
            [calcVC userDidPressNumber:numberFiveButton];
            [[calcVC.display.text should] equal:@"35"];
        });
    });
});
SPEC_END