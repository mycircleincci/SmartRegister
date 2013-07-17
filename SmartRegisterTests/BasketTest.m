#import "MCBasket.h"

#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>

@interface BasketTest : SenTestCase
@end

@implementation BasketTest
{
    
}

- (void)testBasketExists
{
    MCBasket *sut = [[MCBasket alloc] init];
    
    assertThat(sut, is(notNilValue()));
}

@end
