#import "Token.h"
#import "RowWithUniformColorRule.h"

@interface RowWithUniformColorRuleTest : SenTestCase
@end

@implementation RowWithUniformColorRuleTest {
}

- (void)testHasToBeSameColorOfOppositeNeighbourIfItsNotEmpty {
	Token *yellowCircleToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	Token *yellowSquareToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeSquare];
	Token *yellowTriangleToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeTriangle];
	Token *blueCircleToken = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeCircle];

	[yellowCircleToken putNeighbour:yellowSquareToken toSide:TokenSideLeft];
	RowWithUniformColorRule *rule = [[RowWithUniformColorRule alloc] initWithToken:yellowCircleToken];
	expect([rule appliesToToken:yellowTriangleToken atSide:TokenSideRight]).toBeTruthy();
	expect([rule appliesToToken:blueCircleToken atSide:TokenSideRight]).toBeFalsy();
}



@end