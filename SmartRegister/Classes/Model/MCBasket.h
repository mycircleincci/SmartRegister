
#import <Foundation/Foundation.h>

@class MCBasketItem;

@protocol MCBasketDelegate <NSObject>

@optional
- (void)basketDidUpdate;

@end

@interface MCBasket : NSObject <UITableViewDataSource>

@property (weak) id <MCBasketDelegate> delegate;

- (void)addItem:(MCBasketItem *)item;
- (void)removeItem:(MCBasketItem *)item;
- (void)clearItems;
- (NSInteger)numberOfItems;
- (NSInteger)totalPrice;

- (MCBasketItem *)itemAtRow:(NSUInteger)row;

@end
