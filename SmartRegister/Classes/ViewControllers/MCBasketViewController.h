
#import <UIKit/UIKit.h>
#import "MCBasket.h"

@interface MCBasketViewController : UIViewController <MCBasketDelegate>

@property (strong) MCBasket *basket;
@property (weak) IBOutlet UITableView *tableview;
@property (weak) IBOutlet UILabel *totalLabel;

- (IBAction)addItemButtonTapped:(id)sender;
- (IBAction)clearButtonTapped:(id)sender;

@end
