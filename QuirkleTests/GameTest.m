#import "Game.h"
#import "Token.h"
#import "Player.h"

@interface GameTest : SenTestCase
@end

@implementation GameTest {
	Game *game;
}

- (void)setUp {
	game = [[Game alloc] init];
}

- (void)testStartsWithAllTokens3Times {
	NSArray *tokens = game.tokens;
	expect([self tokensWithType:YellowCircleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:YellowSquareToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:YellowTriangleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:YellowFlowerToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:YellowStarToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:YellowCrossToken in:tokens].count).toEqual(3);

	expect([self tokensWithType:BlueCircleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:BlueSquareToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:BlueTriangleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:BlueFlowerToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:BlueStarToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:BlueCrossToken in:tokens].count).toEqual(3);

	expect([self tokensWithType:RedCircleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:RedSquareToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:RedTriangleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:RedFlowerToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:RedStarToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:RedCrossToken in:tokens].count).toEqual(3);

	expect([self tokensWithType:GreenCircleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:GreenSquareToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:GreenTriangleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:GreenFlowerToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:GreenStarToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:GreenCrossToken in:tokens].count).toEqual(3);

	expect([self tokensWithType:OrangeCircleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:OrangeSquareToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:OrangeTriangleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:OrangeFlowerToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:OrangeStarToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:OrangeCrossToken in:tokens].count).toEqual(3);

	expect([self tokensWithType:PurpleCircleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:PurpleSquareToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:PurpleTriangleToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:PurpleFlowerToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:PurpleStarToken in:tokens].count).toEqual(3);
	expect([self tokensWithType:PurpleCrossToken in:tokens].count).toEqual(3);
}

- (NSArray *)tokensWithType:(Token *)pattern in:(NSArray *)array {
	NSMutableArray *result = [NSMutableArray array];
	[array enumerateObjectsUsingBlock:^(Token *token, NSUInteger idx, BOOL *stop) {
		if ([token isEqual:pattern]) {
			[result addObject:token];
		}
	}];
	return result;
}

- (void)testAddTwoToFourPlayer {
	for (int i = 0; i < 4; i++) {
		[game addPlayer:[[Player alloc] init]];
	}
	expect(game.players.count).toEqual(4);
}

- (void)testTokensAreShuffledAtStart {
	//TODO
}

- (void)testEveryPlayerPulls6TokensAtStart {
	// TODO
}

@end