#import "AllTokensInRowMustBeDifferentRule.h"

@interface GameRule ()
- (TokenSide)oppositeSideOf:(TokenSide)side;
@end

@implementation AllTokensInRowMustBeDifferentRule {
}

- (BOOL)appliesToToken:(Token *)otherToken atSide:(TokenSide)side {
	BOOL applies = YES;
	TokenSide oppositeSide = [self oppositeSideOf:side];
	Token *oppositeSideToken = [self.token neighbourAtSide:oppositeSide];
	if (oppositeSideToken != nil) {
		AllTokensInRowMustBeDifferentRule *rule = [[AllTokensInRowMustBeDifferentRule alloc] initWithToken:oppositeSideToken];
		applies &= [rule appliesToToken:otherToken atSide:side];
	}
	applies &= ![self.token isEqual:otherToken];
	return applies;
}

@end