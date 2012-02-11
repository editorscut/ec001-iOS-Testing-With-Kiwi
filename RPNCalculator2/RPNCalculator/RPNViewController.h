#import <UIKit/UIKit.h>

@interface RPNViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)userDidPressNumber:(UIButton *)sender;
- (void)clearDisplay;
@end
