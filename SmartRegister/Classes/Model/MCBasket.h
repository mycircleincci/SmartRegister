
#import <Foundation/Foundation.h>

@interface MCBasket : NSObject <UITableViewDataSource>

- (void)addItem:(id)item;
- (void)removeItem:(id)item;
- (NSInteger)numberOfItems;

@end
