
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
    //[self.tableview setDelegate:self];
}

- (void)basketDidUpdate
{
    [_tableview reloadData];
    
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

- (IBAction)clearButtonTapped:(id)sender
{
    [_basket clearItems];
}

@end