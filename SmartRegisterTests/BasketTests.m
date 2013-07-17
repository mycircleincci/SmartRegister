
#import <SenTestingKit/SenTestingKit.h>
#import "MCBasket.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>

@interface BasketTest : SenTestCase
@end

@implementation BasketTest
{
    MCBasket *_sut;
}

- (void)setUp
{
    [super setUp];
    _sut = [[MCBasket alloc] init];
}

- (void)testBasketExists
{
    assertThat(_sut, is(notNilValue()));
}

- (void)testBasketShouldBeEmpty
{
    assertThatInt([_sut numberOfItems], is(equalToInteger(0)));
}

- (void)testAddingNilThrowsException
{
    STAssertThrows([_sut addItem:nil], @"addItem:nil should throw");
}

- (void)testNumberOfItemsIncreases
{
    id item = [NSObject new];
    [_sut addItem:item];
    
    assertThatInt([_sut numberOfItems], is(equalToInteger(1)));
}

- (void)testRemovingNilThrowsException
{
    STAssertThrows([_sut removeItem:nil], @"removeItem:nil should throw");
}

- (void)testNumberOfItemsDecreases
{
    id item = [NSObject new];
    [_sut addItem:item];
    [_sut removeItem:item];
    
    assertThatInteger([_sut numberOfItems], is(equalToInteger(0)));
}

- (void)testRemoveItemFromEmptyBasketDoesNotThrow
{
    id item = [NSObject new];
    STAssertNoThrow([_sut removeItem:item], @"Removing item from empty basket should not throw");
}

- (void)testBasketConformsToTableViewDataSource
{
    STAssertTrue([_sut conformsToProtocol:@protocol(UITableViewDataSource)], @"Basket should act as tableview datasource");
}

- (void)testTableViewNumberOfRowsIsBasketNumberOfItemsWHenEmpty
{
    NSUInteger tableViewNumberOfRows = [_sut tableView:nil numberOfRowsInSection:0];
    assertThatInteger(tableViewNumberOfRows, is(equalToInteger(0)));
}

- (void)testTableViewNumberOfRowsIsBasketNumberOfItemsWhenNotEmpty
{
    id item = [NSObject new];
    [_sut addItem:item];
    
    NSUInteger tableViewNumberOfRows = [_sut tableView:nil numberOfRowsInSection:0];
    assertThatInteger(tableViewNumberOfRows, is(equalToInteger(1)));
}

- (void)testBasketReturnsItem
{
    id item
}

@end
