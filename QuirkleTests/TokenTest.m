#import "Token.h"
#import "GameRule.h"

@interface TokenTest : SenTestCase
@end

@implementation TokenTest {
	Token *token;
}

- (void)setUp {
	token = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
}

- (void)testHasColor {
	expect([[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeCircle].color).toEqual(TokenColorBlue);
}

- (void)testCanHaveSixDifferentColors {
	[token setColor:TokenColorYellow];
	expect(token.color).toEqual(TokenColorYellow);
	[token setColor:TokenColorBlue];
	expect(token.color).toEqual(TokenColorBlue);
	[token setColor:TokenColorRed];
	expect(token.color).toEqual(TokenColorRed);
	[token setColor:TokenColorGreen];
	expect(token.color).toEqual(TokenColorGreen);
	[token setColor:TokenColorOrange];
	expect(token.color).toEqual(TokenColorOrange);
	[token setColor:TokenColorPurple];
	expect(token.color).toEqual(TokenColorPurple);
}

- (void)testHasShape {
	expect([[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeSquare].shape).toEqual(TokenShapeSquare);
}

- (void)testHasSixDifferentShapes {
	[token setShape:TokenShapeCircle];
	expect(token.shape).toEqual(TokenShapeCircle);
	[token setShape:TokenShapeSquare];
	expect(token.shape).toEqual(TokenShapeSquare);
	[token setShape:TokenShapeTriangle];
	expect(token.shape).toEqual(TokenShapeTriangle);
	[token setShape:TokenShapeFlower];
	expect(token.shape).toEqual(TokenShapeFlower);
	[token setShape:TokenShapeStar];
	expect(token.shape).toEqual(TokenShapeStar);
	[token setShape:TokenShapeCrystal];
	expect(token.shape).toEqual(TokenShapeCrystal);
}

- (void)testInitiallyHasNoNeighbours {
	expect([token neighbourAtSide:TokenSideTop]).toBeNil();
	expect([token neighbourAtSide:TokenSideLeft]).toBeNil();
	expect([token neighbourAtSide:TokenSideBottom]).toBeNil();
	expect([token neighbourAtSide:TokenSideRight]).toBeNil();
}

- (void)testCanHaveNeighbour {
	Token *otherToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	[token putNeighbour:otherToken toSide:TokenSideLeft];
	expect([token neighbourAtSide:TokenSideLeft]).toEqual(otherToken);
}

- (void)testIsLeftNeighbourOfItsRightNeighbour {
	Token *otherToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	[token putNeighbour:otherToken toSide:TokenSideLeft];
	expect([otherToken neighbourAtSide:TokenSideRight]).toEqual(token);
}

- (void)testIsRightNeighbourOfItsLeftNeighbour {
	Token *otherToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	[token putNeighbour:otherToken toSide:TokenSideRight];
	expect([otherToken neighbourAtSide:TokenSideLeft]).toEqual(token);
}

- (void)testIsTopNeighbourOfItsBottomNeighbour {
	Token *otherToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	[token putNeighbour:otherToken toSide:TokenSideTop];
	expect([otherToken neighbourAtSide:TokenSideBottom]).toEqual(token);
}

- (void)testIsBottomNeighbourOfItsTopNeighbour {
	Token *otherToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	[token putNeighbour:otherToken toSide:TokenSideBottom];
	expect([otherToken neighbourAtSide:TokenSideTop]).toEqual(token);
}

- (void)testPuttingNeighbourChecksAllRules {
	Token *otherToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];

	id ruleMock = [OCMockObject mockForClass:[GameRule class]];
	[[ruleMock expect] appliesToToken:otherToken atSide:TokenSideLeft];

	NSArray *rules = [NSArray arrayWithObject:ruleMock];
	[token setGameRules:rules];
	[token putNeighbour:otherToken toSide:TokenSideLeft];

	[ruleMock verify];
}

@end