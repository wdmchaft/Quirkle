#import "AllTokensInRowMustBeDifferentRule.h"

@interface AllTokensInRowMustBeDifferentRuleTest : SenTestCase
@end

@implementation AllTokensInRowMustBeDifferentRuleTest {
	Token *yellowCircleToken;
	AllTokensInRowMustBeDifferentRule *rule;
}

- (void)setUp {
	yellowCircleToken = YellowCircleToken;
}

- (void)testNeighbourMustBeDifferent {
	rule = [[AllTokensInRowMustBeDifferentRule alloc] initWithToken:yellowCircleToken];
	expect([rule appliesToToken:YellowCircleToken atSide:TokenSideLeft]).toBeFalsy();
	expect([rule appliesToToken:YellowSquareToken atSide:TokenSideLeft]).toBeTruthy();
}

- (void)testRuleAppliesToAllNeighboursInRow {
	Token *blueCircleToken = BlueCircleToken;
	rule = [[AllTokensInRowMustBeDifferentRule alloc] initWithToken:blueCircleToken];
	[yellowCircleToken putNeighbour:blueCircleToken toSide:TokenSideLeft];
//	expect([rule appliesToToken:YellowCircleToken atSide:TokenSideLeft]).toBeFalsy();
	expect([rule appliesToToken:RedCircleToken atSide:TokenSideLeft]).toBeTruthy();
}
@end