
#import "MCBasketViewController.h"
#import "MCBasketItem.h"

@interface MCBasketViewController ()

@end

@implementation MCBasketViewController
{
    MCBasket *_basket;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    _basket = [[MCBasket alloc] init];
    [_basket setDelegate:self];
    [self.tableview setDataSource:_basket];
}

- (void)basketDidAddItem
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_basket numberOfItems]-1 inSection:0];
    [_tableview insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self updateTotalLabel];
}

- (void)basketDidRemoveItemAtRow:(NSInteger)row
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [_tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self updateTotalLabel];  
}

- (void)basketDidClear
{
    [_tableview reloadData];
}

- (IBAction)clearButtonTapped:(id)sender
{
    [_basket clearItems];
}

- (void)updateTotalLabel
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setCurrencySymbol:@"£"];
    NSString *formattedTotal = [formatter stringFromNumber:[NSNumber numberWithFloat:(float)_basket.totalPrice/100]];
    
    [_totalLabel setText:formattedTotal];
}

- (IBAction)addItemButtonTapped:(id)sender
{
    NSInteger tag = [sender tag];
    MCBasketItem *item = [[MCBasketItem alloc] init];
    
    switch (tag) {
        case 0:
            [item setPrice:250];
            [item setTitle:@"Latte"];
            [item setOptions:@"Medium"];
            break;
            
        case 1:
            [item setPrice:250];
            [item setTitle:@"Latte"];
            [item setOptions:@"Medium, Soya"];
            break;
            
        case 2:
            [item setPrice:275];
            [item setTitle:@"Latte"];
            [item setOptions:@"Medium, Soya, Vanilla"];
            break;
            
        case 3:
            [item setPrice:250];
            [item setTitle:@"Cappuccino"];
            [item setOptions:@"Small"];
            break;
            
        case 4:
            [item setPrice:350];
            [item setTitle:@"Cappuccino"];
            [item setOptions:@"Medium"];
            break;
            
        case 5:
            [item setPrice:450];
            [item setTitle:@"Cappuccino"];
            [item setOptions:@"Large"];
            break;
    }
    
    [_basket addItem:item];
}

@end