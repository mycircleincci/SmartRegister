
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

@end
