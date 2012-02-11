#import "Kiwi.h"
#import "RPNViewController.h"

@interface RPNViewController(NumberEntryTesting)
@property (weak, nonatomic) IBOutlet UILabel *display;
- (void)clearDisplay;
- (IBAction)userDidPressNumber:(UIButton *)sender;
@end

SPEC_BEGIN(RPNNumberEntrySpec)
//...
describe(@"Calculator View Controller", ^{
    RPNViewController *calcVC = [[RPNViewController alloc]init ];
    UILabel *label = [[UILabel alloc] init];
    [calcVC.view addSubview:label];
    calcVC.display = label;
    UIButton *numberThreeButton = [[UIButton alloc] init];
    [numberThreeButton setTitle:@"3" 
                       forState:UIControlStateNormal];
    UIButton *numberFiveButton = [[UIButton alloc] init];
    [numberFiveButton setTitle:@"5" 
                       forState:UIControlStateNormal];
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