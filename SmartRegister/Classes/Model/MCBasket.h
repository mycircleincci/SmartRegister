
#import <Foundation/Foundation.h>

@class MCBasketItem;

@interface MCBasket : NSObject <UITableViewDataSource>

- (void)addItem:(MCBasketItem *)item;
- (void)removeItem:(MCBasketItem *)item;
- (NSInteger)numberOfItems;
- (NSInteger)totalPrice;

- (MCBasketItem *)itemAtRow:(NSUInteger)row;

@end
