#import "GameRule.h"


@interface GameRule ()
- (TokenSide)oppositeSideOf:(TokenSide)side;
@end

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

- (TokenSide)oppositeSideOf:(TokenSide)side {
	switch (side) {
		case TokenSideLeft: return TokenSideRight;
		case TokenSideRight: return TokenSideLeft;
		case TokenSideTop: return TokenSideBottom;
		case TokenSideBottom: return TokenSideTop;
	}
	return TokenSideLeft;
}

@end