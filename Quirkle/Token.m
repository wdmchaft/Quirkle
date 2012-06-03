#import "Token.h"


@implementation Token {
	TokenColor _color;
	TokenShape _shape;
	NSMutableArray *_neighbours;
}

@synthesize color = _color;
@synthesize shape = _shape;

- (Token *)initWithColor:(TokenColor)color shape:(TokenShape)shape {
	self = [super init];
	if (self) {
		_color = color;
		_shape = shape;
		_neighbours = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)addNeighbour:(Token *)token {
	if ([self isNotNeighbour:token] && ([self isSameColor:token] || [self isSameShape:token])) {
		[_neighbours addObject:token];
		[token addNeighbour:self];
	}
}

- (BOOL)isNotNeighbour:(Token *)token {
	return ![_neighbours containsObject:token];
}

- (BOOL)isSameColor:(Token *)token {
	return token.color == self.color;
}

- (BOOL)isSameShape:(Token *)token {
	return self.shape == token.shape;
}

- (BOOL)isNeighbourOf:(Token *)otherToken {
	return [_neighbours containsObject:otherToken];
}

@end