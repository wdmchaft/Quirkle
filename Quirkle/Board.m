#import "Board.h"


@implementation Board {
	NSMutableArray *_tokens;
}

@synthesize tokens = _tokens;

- (id)init {
	self = [super init];
	if (self) {
		_tokens = [[NSMutableArray alloc] init];
	}
	return self;
}


@end