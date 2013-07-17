
#import <SenTestingKit/SenTestingKit.h>
#import "MCBasket.h"
#import "MCBasketItem.h"
#import "MCBasketCell.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

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

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
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
    MCBasketItem *item = [[MCBasketItem alloc] init];
    [_sut addItem:item];
    
    assertThatInt([_sut numberOfItems], is(equalToInteger(1)));
}

- (void)testRemovingNilThrowsException
{
    STAssertThrows([_sut removeItem:nil], @"removeItem:nil should throw");
}

- (void)testNumberOfItemsDecreases
{
    MCBasketItem *item = [[MCBasketItem alloc] init];
    [_sut addItem:item];
    [_sut removeItem:item];
    
    assertThatInteger([_sut numberOfItems], is(equalToInteger(0)));
}

- (void)testRemoveItemFromEmptyBasketDoesNotThrow
{
    MCBasketItem *item = [[MCBasketItem alloc] init];
    STAssertNoThrow([_sut removeItem:item], @"Removing item from empty basket should not throw");
}

- (void)testBasketConformsToTableViewDataSource
{
    STAssertTrue([_sut conformsToProtocol:@protocol(UITableViewDataSource)], @"Basket should act as tableview datasource");
}

- (void)testTableViewNumberOfRowsIsBasketNumberOfItemsWhenEmpty
{
    NSUInteger tableViewNumberOfRows = [_sut tableView:nil numberOfRowsInSection:0];
    assertThatInteger(tableViewNumberOfRows, is(equalToInteger(0)));
}

- (void)testTableViewNumberOfRowsIsBasketNumberOfItemsWhenNotEmpty
{
    MCBasketItem *item = [[MCBasketItem alloc] init];
    [_sut addItem:item];
    
    NSUInteger tableViewNumberOfRows = [_sut tableView:nil numberOfRowsInSection:0];
    assertThatInteger(tableViewNumberOfRows, is(equalToInteger(1)));
}

- (void)testItemAtRowDoesNotThrowWhenEmpty
{
    STAssertNoThrow([_sut itemAtRow:0], @"Empty basket should not throw when item requested");
}

- (void)testBasketReturnsCorrectItem
{
    MCBasketItem *firstItem = [[MCBasketItem alloc] init];
    [_sut addItem:firstItem];
    MCBasketItem *secondItem = [[MCBasketItem alloc] init];
    [_sut addItem:secondItem];
    
    id returnedItem = [_sut itemAtRow:1];
    
    assertThat(returnedItem, is(equalTo(secondItem)));
}

- (void)testBasketTotalPriceIsZero
{
    assertThatInteger([_sut totalPrice], is(equalToInteger(0)));
}

- (void)testBasketTotalPriceIsEqualToItemTotalPrice
{
    MCBasketItem *basketItem = [[MCBasketItem alloc] init];
    [basketItem setPrice:500];
    [_sut addItem:basketItem];
    
    assertThatInteger([_sut totalPrice], is(equalToInteger(500)));
}

- (void)testCellProvidedWithItemWhenCreated
{
    MCBasketItem *basketItem = [[MCBasketItem alloc] init];
    [_sut addItem:basketItem];
    
    MCBasketCell *mockCell = mock([MCBasketCell class]);
    NSIndexPath *zeroIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableView *mockTableView = mock([UITableView class]);
    [given([mockTableView dequeueReusableCellWithIdentifier:@"BasketCell" forIndexPath:zeroIndexPath]) willReturn:mockCell];;

    [_sut tableView:mockTableView cellForRowAtIndexPath:zeroIndexPath];
    
    [verify(mockCell) setBasketItem:basketItem];
}

- (void)testBasketItemHasABasket
{
    MCBasketItem *basketItem = [[MCBasketItem alloc] init];
    [_sut addItem:basketItem];
    
    MCBasketItem *returnedItem = [_sut itemAtRow:0];
    
    assertThat([returnedItem basket], is(equalTo(_sut)));
}

- (void)testBasketInformsDelegateWhenItemAdded
{
    id <MCBasketDelegate> mockDelegate = mockProtocol(@protocol(MCBasketDelegate));
    [_sut setDelegate:mockDelegate];
    
    MCBasketItem *item = [[MCBasketItem alloc] init];
    [_sut addItem:item];
    
    [verify(mockDelegate) basketDidUpdate];
}

- (void)testBasketInformsDelegateWhenItemRemoved
{
    id <MCBasketDelegate> mockDelegate = mockProtocol(@protocol(MCBasketDelegate));
    [_sut setDelegate:mockDelegate];
    
    MCBasketItem *item = [[MCBasketItem alloc] init];
    [_sut removeItem:item];
    
    [verify(mockDelegate) basketDidUpdate];
}

- (void)testClearingBasketRemovesAllItems
{
    [_sut clearItems];
    
    assertThatInteger([_sut numberOfItems], is(equalToInteger(0)));
}

- (void)testBasketInformsDelegateWhenItemsCleared
{
    id <MCBasketDelegate> mockDelegate = mockProtocol(@protocol(MCBasketDelegate));
    [_sut setDelegate:mockDelegate];
    
    [_sut clearItems];
    
    [verify(mockDelegate) basketDidUpdate];
}


@end
