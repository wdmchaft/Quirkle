#import "Game.h"
#import "Token.h"


@implementation Game {
	NSMutableArray *_tokens;
}
@synthesize tokens = _tokens;

- (id)init {
	self = [super init];
	if (self) {
		[self initializeTokens];
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


@end