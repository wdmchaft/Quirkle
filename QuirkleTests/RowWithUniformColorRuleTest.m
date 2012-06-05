#import "Token.h"
#import "RowWithUniformColorRule.h"

#define YellowCircleToken [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle]
#define YellowSquareToken [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeSquare]
#define YellowTriangleToken [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeTriangle]
#define BlueCircleToken [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeCircle]
#define RedCircleToken [[Token alloc] initWithColor:TokenColorRed shape:TokenShapeCircle]

@interface RowWithUniformColorRuleTest : SenTestCase
@end

@implementation RowWithUniformColorRuleTest {
}

- (void)testSameColorRuleAppliesToAllTokenInRow {
	Token *yellowCircleToken = YellowCircleToken;
	[yellowCircleToken putNeighbour:YellowSquareToken toSide:TokenSideLeft];
	RowWithUniformColorRule *rule = [[RowWithUniformColorRule alloc] initWithToken:yellowCircleToken];

	expect([rule appliesToToken:YellowTriangleToken atSide:TokenSideRight]).toBeTruthy();
	expect([rule appliesToToken:BlueCircleToken atSide:TokenSideRight]).toBeFalsy();
}

- (void)testSameShapeRuleAppliesToAllTokenInRow {
	Token *yellowCircleToken = YellowCircleToken;
	[yellowCircleToken putNeighbour:RedCircleToken toSide:TokenSideLeft];
	RowWithUniformColorRule *rule = [[RowWithUniformColorRule alloc] initWithToken:yellowCircleToken];

	expect([rule appliesToToken:BlueCircleToken atSide:TokenSideRight]).toBeTruthy();
	expect([rule appliesToToken:YellowTriangleToken atSide:TokenSideRight]).toBeFalsy();
}


@end