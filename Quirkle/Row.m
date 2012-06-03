#import "Row.h"
#import "Token.h"


@implementation Row {
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


- (void)addToken:(Token *)token {
	[_tokens addObject:token];
}
@end