
#import <Foundation/Foundation.h>

@class MCBasket;

@interface MCBasketItem : NSObject

@property (strong) MCBasket *basket;
@property (assign) NSInteger price;
@property (strong) NSString *title;
@property (strong) NSString *options;

- (void)removeFromBasket;

@end
