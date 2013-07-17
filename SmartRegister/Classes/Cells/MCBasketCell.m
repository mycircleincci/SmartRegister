
#import "MCBasketCell.h"
#import "MCBasketItem.h"

@implementation MCBasketCell

- (void)setBasketItem:(MCBasketItem *)basketItem
{
    _basketItem = basketItem;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setCurrencySymbol:@"£"];
    NSString *formattedTotal = [formatter stringFromNumber:[NSNumber numberWithFloat:(float)basketItem.price/100]];
    
    [_priceLabel setText:formattedTotal];
    [_titleLabel setText:basketItem.title];
    [_optionLabel setText:basketItem.options];
}

- (IBAction)deleteButtonTapped:(id)sender
{
    [_basketItem removeFromBasket];
}

@end
