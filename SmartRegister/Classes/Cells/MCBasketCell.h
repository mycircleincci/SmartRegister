
#import <UIKit/UIKit.h>

@class MCBasketItem;

@interface MCBasketCell : UITableViewCell

@property (strong) IBOutlet UILabel *titleLabel;
@property (strong) IBOutlet UILabel *optionLabel;
@property (strong) IBOutlet UILabel *priceLabel;

@property (nonatomic, strong) MCBasketItem *basketItem;

- (IBAction)deleteButtonTapped:(id)sender;

@end
