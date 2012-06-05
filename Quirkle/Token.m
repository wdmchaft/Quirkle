#import "Token.h"
#import "GameRule.h"
#import "EmptyNeighbourRule.h"
#import "SameColorOrShapeRule.h"


@implementation Token {
	TokenColor _color;
	TokenShape _shape;
	NSMutableArray *_neighbours;
	NSArray *_gameRules;
}

@synthesize color = _color;
@synthesize shape = _shape;
@synthesize gameRules = _gameRules;


- (Token *)initWithColor:(TokenColor)color shape:(TokenShape)shape {
	self = [super init];
	if (self) {
		_color = color;
		_shape = shape;
		_neighbours = [[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil];
	}
	return self;
}

- (void)putNeighbour:(Token *)token toSide:(TokenSide)side {
	BOOL allRulesApply = YES;
	for (GameRule *rule in self.gameRules) {
		allRulesApply &= [rule appliesToToken:token atSide:side];
	}
	if (allRulesApply) {
		[_neighbours replaceObjectAtIndex:side withObject:token];
		[token putNeighbour:self toSide:[self oppositeSideOf:side]];
	}
}

- (TokenSide)oppositeSideOf:(TokenSide)side {
	switch (side) {
		case TokenSideLeft: return TokenSideRight;
		case TokenSideRight: return TokenSideLeft;
		case TokenSideTop: return TokenSideBottom;
		case TokenSideBottom: return TokenSideTop;
	}
	return TokenSideLeft;
}

- (Token *)neighbourAtSide:(TokenSide)side {
	if ([_neighbours objectAtIndex:side] == [NSNull null]) {
		return nil;
	}
	return [_neighbours objectAtIndex:side];
}

- (NSArray *)gameRules {
	if (_gameRules == nil) {
		GameRule *emptyNeighbourRule = [[EmptyNeighbourRule alloc] initWithToken:self];
		GameRule *sameColorOrShapeRule = [[SameColorOrShapeRule alloc] initWithToken:self];
		_gameRules = [[NSArray alloc] initWithObjects:emptyNeighbourRule, sameColorOrShapeRule, nil];
	}
	return _gameRules;
}
@end