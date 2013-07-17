
#import <SenTestingKit/SenTestingKit.h>
#import "MCBasketItem.h"
#import "MCBasket.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

@interface BasketItemTests : SenTestCase
@end

@implementation BasketItemTests
{
    
}

- (void)testBasketRemovesItem
{
    MCBasket *mockBasket = mock([MCBasket class]);
    MCBasketItem *sut = [[MCBasketItem alloc] init];
    [sut setBasket:mockBasket];
    
    [sut removeFromBasket];
    
    [verify(mockBasket) removeItem:sut];
}

@end
