
#import <SenTestingKit/SenTestingKit.h>
#import "MCBasketViewController.h"
#import "MCBasket.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

@interface BasketViewControllerTests : SenTestCase
@end

@implementation BasketViewControllerTests
{
    MCBasketViewController *_sut;
}

- (void)setUp
{
    [super setUp];
    _sut = [[MCBasketViewController alloc] init];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

- (void)testViewControllerConformsToBasketDelegateProtocol
{
    STAssertTrue([_sut conformsToProtocol:@protocol(MCBasketDelegate)], @"VC should conform to BasketDelegateProtocol");
}

- (void)testViewControllerInsertsRowsWhenBasketAddsItem
{
    UITableView *mockTableView = mock([UITableView class]);
    [_sut setTableview:mockTableView];
    MCBasket *mockBasket = mock([MCBasket class]);
    [given([mockBasket numberOfItems]) willReturnInteger:0];
    [_sut setBasket:mockBasket];
    
    [_sut basketDidAddItem];
    
    [verify(mockTableView) insertRowsAtIndexPaths:(NSArray *)anything() withRowAnimation:UITableViewRowAnimationFade];
}

- (void)testViewControllerDeletesRowsWhenBasketRemovesItem
{
    UITableView *mockTableView = mock([UITableView class]);
    [_sut setTableview:mockTableView];
    MCBasket *mockBasket = mock([MCBasket class]);
    [given([mockBasket numberOfItems]) willReturnInteger:0];
    [_sut setBasket:mockBasket];
    
    [_sut basketDidRemoveItemAtRow:0];
    
    [verify(mockTableView) deleteRowsAtIndexPaths:(NSArray *)anything() withRowAnimation:UITableViewRowAnimationFade];
}

- (void)testTableReloadedWhenBasketCleared
{
    UITableView *mockTableView = mock([UITableView class]);
    [_sut setTableview:mockTableView];

    [_sut basketDidClear];
    
    [verify(mockTableView) reloadData];
}

- (void)testTotalLabelUpdatedWithAddedItem
{
    UILabel *mockLabel = mock([UILabel class]);
    [_sut setTotalLabel:mockLabel];
    MCBasket *mockBasket = mock([MCBasket class]);
    [_sut setBasket:mockBasket];
    
    [_sut basketDidAddItem];
    
    [verify(mockLabel) setText:(NSString*)anything()];
}

- (void)testTotalLabelUpdatedWithRemoveItem
{
    UILabel *mockLabel = mock([UILabel class]);
    [_sut setTotalLabel:mockLabel];
    MCBasket *mockBasket = mock([MCBasket class]);
    [given([mockBasket totalPrice]) willReturnInteger:500];
    [_sut setBasket:mockBasket];
    
    [_sut basketDidRemoveItemAtRow:0];
    
    [verify(mockLabel) setText:@"£5.00"];
}

@end
