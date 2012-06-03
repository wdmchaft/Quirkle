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
		_neighbours = [[NSMutableArray alloc] init];
		_color = color;
		_shape = shape;
	}
	return self;
}

- (void)addNeighbour:(Token *)neighbour {
	if (![_neighbours containsObject:neighbour] && _neighbours.count < 4) {
		[_neighbours addObject:neighbour];
		[neighbour addNeighbour:self];
	}
}

- (BOOL)isNeighbour:(Token *)otherToken {
	return [_neighbours containsObject:otherToken];
}
@end