
#import "MCBasket.h"
#import "MCBasketItem.h"

@implementation MCBasket
{
    NSMutableArray *_items;
}

- (void)addItem:(id)item
{
    [self handleItemExceptions:item];

    [[self items] addObject:item];
}

- (void)removeItem:(id)item
{
    [self handleItemExceptions:item];
    
    [[self items] removeObject:item];
}

- (id)itemAtRow:(NSUInteger)row
{
    return [[self items] objectAtIndex:row];
}

- (NSInteger)numberOfItems
{
    return [[self items] count];
}

- (NSInteger)totalPrice
{
    NSInteger total = 0;
    for (MCBasketItem *eachItem in [self items])
    {
        total += eachItem.price;
    }
    return total;
}

#pragma mark - TableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfItems];;
}

#pragma mark - Helpers

- (void)handleItemExceptions:(id)item
{
    if (item == nil) {
        NSException *exception = [NSException exceptionWithName:@"BasketNilItemException" reason:@"Provided nil basket item" userInfo:nil];
        [exception raise];
    }
}

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    
    return _items;
}

@end
