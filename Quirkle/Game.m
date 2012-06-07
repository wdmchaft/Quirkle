#import "Game.h"
#import "Token.h"
#import "Player.h"

@implementation Game

@synthesize tokens = _tokens;
@synthesize players = _players;

- (id)init {
	self = [super init];
	if (self) {
		[self initializeTokens];
		_players = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)initializeTokens {
	_tokens = [[NSMutableArray alloc] init];
	for (TokenColor color = TokenColorYellow; color <= TokenColorPurple; color++) {
		for (TokenShape shape = TokenShapeCircle; shape <= TokenShapeCross; shape++) {
			for (int tokenCount = 0; tokenCount < TokenCount; tokenCount++) {
				Token *token = [[Token alloc] initWithColor:color shape:shape];
				[_tokens addObject:token];
			}
		}
	}
}

- (void)addPlayer:(Player *)player {
	[_players addObject:player];
}

- (void)startGame {
	srandom((unsigned int) time(NULL));
	[self distributeStartTokens];
}

- (void)distributeStartTokens {
	[_players enumerateObjectsUsingBlock:^(Player *player, NSUInteger idx, BOOL *stop) {
		int startTokenAmount = 6;
		for (int i=0; i< startTokenAmount; i++) {
			[self pullTokenForPlayer:player];
		}
	}];
}

- (void)pullTokenForPlayer:(Player *)player {
	NSUInteger randomIndex = [self randomizedTokenIndex];
	Token *token = [_tokens objectAtIndex:randomIndex];
	[player pullToken:token];
	[_tokens removeObjectAtIndex:randomIndex];
}

- (NSUInteger)randomizedTokenIndex {
	return (NSUInteger) (random() % _tokens.count);
}

@end