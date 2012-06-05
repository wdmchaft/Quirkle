#import "Token.h"
#import "EmptyNeighbourRule.h"

@interface EmptyNeighbourRuleTest : SenTestCase
@end

@implementation EmptyNeighbourRuleTest {
}

- (void)testCanOnlyAddOneNeighbourAtSide {
	Token *token = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	Token *firstToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	Token *secondToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];

	EmptyNeighbourRule *rule = [[EmptyNeighbourRule alloc] initWithToken:token];
	expect([rule appliesToToken:firstToken atSide:TokenSideLeft]).toBeTruthy();
	[token putNeighbour:firstToken toSide:TokenSideLeft];
	expect([rule appliesToToken:secondToken atSide:TokenSideLeft]).toBeFalsy();
}


@end