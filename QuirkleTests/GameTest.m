#import "Board.h"
#import "Game.h"
#import "Token.h"
#import "Player.h"

@interface Game(TestSetter)
- (void)setPlayers:(NSMutableArray *)players;
@end

@implementation Game(TestSetter)
- (void)setPlayers:(NSMutableArray *)players {
	_players = players;
}
@end

@interface Game()
- (void)pullTokenForPlayer:(Player *)player;
- (NSUInteger)randomizedTokenIndex;
@end

@interface GameTest : SenTestCase
@end

@implementation GameTest {
	Game *game;
}

- (void)setUp {
	game = [[Game alloc] init];
}

- (void)tearDown {
	game = nil;
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

- (void)testEveryPlayerPulls6TokensAtStart {
	id player = [OCMockObject mockForClass:[Player class]];
	[[player expect] pullToken:OCMOCK_ANY];
	[[player expect] pullToken:OCMOCK_ANY];
	[[player expect] pullToken:OCMOCK_ANY];
	[[player expect] pullToken:OCMOCK_ANY];
	[[player expect] pullToken:OCMOCK_ANY];
	[[player expect] pullToken:OCMOCK_ANY];
	[game setPlayers:[NSMutableArray arrayWithObject:player]];
	[game startGame];
	[player verify];
}

- (void)testPullingTokensReduzesAmountOfTokensInGame {
	int amount = game.tokens.count;
	Player *player = [OCMockObject niceMockForClass:[Player class]];
	[game pullTokenForPlayer:player];
	expect(game.tokens.count).toEqual(amount - 1);
}

- (void)testPullingTokenIsRandomized {
	id gameMock = [OCMockObject partialMockForObject:game];
	[[gameMock expect] randomizedTokenIndex];
	Player *player = [OCMockObject niceMockForClass:[Player class]];
	[game pullTokenForPlayer:player];
	[gameMock verify];
}

- (void)testInitializedEmptyBoardAtStart {
	[game startGame];
	expect(game.board.tokens.count).toEqual(0);
}

//- (void)testAsksEveryPlayerToPutTokensToBoard {
//	Board *board = [[Board alloc] init];
//	[game setBoard:board];
//	id player1 = [OCMockObject niceMockForClass:[Player class]];
//	[[player1 expect] putTokensToBoard:board];
//	id player2 = [OCMockObject niceMockForClass:[Player class]];
//	[[player2 expect] putTokensToBoard:board];
//	[game setPlayers:[NSMutableArray arrayWithObjects:player1, player2, nil]];
//	[game startGame];
//	[player1 verify];
//	[player2 verify];
//}

@end