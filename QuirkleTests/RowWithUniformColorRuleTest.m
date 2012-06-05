#import "Token.h"
#import "RowWithUniformColorRule.h"

@interface RowWithUniformColorRuleTest : SenTestCase
@end

@implementation RowWithUniformColorRuleTest {
	Token *yellowCircleToken;
	RowWithUniformColorRule *rule;
}

- (void)setUp {
	yellowCircleToken = YellowCircleToken;
	rule = [[RowWithUniformColorRule alloc] initWithToken:yellowCircleToken];
}

- (void)testSameColorRuleAppliesToAllTokenInRow {
	[yellowCircleToken putNeighbour:YellowSquareToken toSide:TokenSideLeft];
	expect([rule appliesToToken:YellowTriangleToken atSide:TokenSideRight]).toBeTruthy();
	expect([rule appliesToToken:BlueCircleToken atSide:TokenSideRight]).toBeFalsy();
}

- (void)testSameShapeRuleAppliesToAllTokenInRow {
	[yellowCircleToken putNeighbour:RedCircleToken toSide:TokenSideLeft];
	expect([rule appliesToToken:BlueCircleToken atSide:TokenSideRight]).toBeTruthy();
	expect([rule appliesToToken:YellowTriangleToken atSide:TokenSideRight]).toBeFalsy();
}

@end