#import "RowWithUniformColorRule.h"

@interface GameRule ()
- (TokenSide)oppositeSideOf:(TokenSide)side;
@end

@implementation RowWithUniformColorRule {
}

- (BOOL)appliesToToken:(Token *)otherToken atSide:(TokenSide)side {
	Token *oppositeNeighbourToken = [self.token neighbourAtSide:[self oppositeSideOf:side]];
	if (oppositeNeighbourToken == nil) {
		return YES;
	} else if ([self appliesToSameColorRuleWithNeighbour:oppositeNeighbourToken]) {
		if (otherToken.color == oppositeNeighbourToken.color) {
			return YES;
		}
	} else if ([self appliesToSameShapeRuleWithNeighbour:oppositeNeighbourToken]) {
		if (otherToken.shape == oppositeNeighbourToken.shape) {
			return YES;
		}
	}
	return NO;
}

- (BOOL)appliesToSameColorRuleWithNeighbour:(Token *)oppositeNeighbourToken {
	return self.token.color == oppositeNeighbourToken.color;
}

- (BOOL)appliesToSameShapeRuleWithNeighbour:(Token *)oppositeNeighbourToken {
	return self.token.shape == oppositeNeighbourToken.shape;
}

@end