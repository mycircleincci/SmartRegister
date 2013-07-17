
#import <SenTestingKit/SenTestingKit.h>
#import "MCBasketViewController.h"
#import "MCBasket.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>

@interface BasketViewControllerTests : SenTestCase
@end

@implementation BasketViewControllerTests
{
    
}

- (void)testViewControllerConformsToBasketDelegateProtocol
{
    MCBasketViewController *sut = [[MCBasketViewController alloc] init];
    
    STAssertTrue([sut conformsToProtocol:@protocol(MCBasketDelegate)], @"VC should conform to BasketDelegateProtocol");
}

@end
