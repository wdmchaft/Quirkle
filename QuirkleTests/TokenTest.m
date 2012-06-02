#import "Token.h"

@interface TokenTest : SenTestCase
@end

@implementation TokenTest {
	Token *token;
}

- (void)setUp {
	token = [[Token alloc] init];
}

- (void)testHasColor {
	[token setColor:TokenColorYellow];
	expect(token.color).toEqual(TokenColorYellow);
}

- (void)testHasSixDifferentColors {
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
	[token setShape:TokenShapeCircle];
	expect(token.shape).toEqual(TokenShapeCircle);
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

@end