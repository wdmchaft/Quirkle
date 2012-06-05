#import "GameRule.h"


@implementation GameRule {
	Token *_token;
}
@synthesize token = _token;


- (id)initWithToken:(Token *)token {
	self = [super init];
	if (self) {
		_token = token;
	}
	return self;
}

- (BOOL)appliesToToken:(Token *)otherToken atSide:(TokenSide)side {
	return NO;
}

@end