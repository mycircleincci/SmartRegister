
#import "MCBasketItem.h"
#import "MCBasket.h"

@implementation MCBasketItem

- (void)removeFromBasket
{
    [_basket removeItem:self];
}

@end
