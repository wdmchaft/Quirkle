#import "Token.h"

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

- (void)testCanHaveNeighbour {
	Token *otherToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	[token addNeighbour:otherToken];
	expect([token isNeighbourOf:otherToken]).toBeTruthy();
	expect([otherToken isNeighbourOf:token]).toBeTruthy();
	Token *noNeighbour = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeCircle];
	expect([token isNeighbourOf:noNeighbour]).toBeFalsy();
}

- (void)testOnlyAddsSameColoredTokensAsNeighbour {
	Token *yellowCircleToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	Token *yellowSquareToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeSquare];
	Token *blueSquareToken = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeSquare];
	[yellowCircleToken addNeighbour:yellowSquareToken];
	[yellowCircleToken addNeighbour:blueSquareToken];
	expect([yellowCircleToken isNeighbourOf:yellowSquareToken]).toBeTruthy();
	expect([yellowCircleToken isNeighbourOf:blueSquareToken]).toBeFalsy();
}

- (void)testOnlyAddsSameShapedTokenAsNeighbour {
	Token *yellowCircleToken = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	Token *blueCircleToken = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeCircle];
	Token *blueSquareToken = [[Token alloc] initWithColor:TokenColorBlue shape:TokenShapeSquare];
	[yellowCircleToken addNeighbour:blueCircleToken];
	[yellowCircleToken addNeighbour:blueSquareToken];
	expect([yellowCircleToken isNeighbourOf:blueCircleToken]).toBeTruthy();
	expect([yellowCircleToken isNeighbourOf:blueSquareToken]).toBeFalsy();
}

@end