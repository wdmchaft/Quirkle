#import "Token.h"
#import "SameColorOrShapeRule.h"

@interface SameColorOrShapeRuleTest : SenTestCase
@end

@implementation SameColorOrShapeRuleTest {
}

- (void)testOnlyAddsSameColoredTokensAsNeighbour {
	Token *yellowCircleToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	Token *yellowSquareToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeSquare];
	Token *blueSquareToken = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeSquare];

	SameColorOrShapeRule *rule = [[SameColorOrShapeRule alloc] initWithToken:yellowCircleToken];
	expect([rule appliesToToken:yellowSquareToken atSide:TokenSideLeft]).toBeTruthy();
	expect([rule appliesToToken:blueSquareToken atSide:TokenSideLeft]).toBeFalsy();
}

- (void)testOnlyAddsSameShapedTokenAsNeighbour {
	Token *yellowCircleToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	Token *blueCircleToken = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeCircle];
	Token *blueSquareToken = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeSquare];

	SameColorOrShapeRule *rule = [[SameColorOrShapeRule alloc] initWithToken:yellowCircleToken];
	expect([rule appliesToToken:blueCircleToken atSide:TokenSideLeft]).toBeTruthy();
	expect([rule appliesToToken:blueSquareToken atSide:TokenSideLeft]).toBeFalsy();
}

@end