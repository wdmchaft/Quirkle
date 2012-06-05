#import "RowWithUniformColorRule.h"


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

- (TokenSide)oppositeSideOf:(TokenSide)side {
	switch (side) {
		case TokenSideLeft: return TokenSideRight;
		case TokenSideRight: return TokenSideLeft;
		case TokenSideTop: return TokenSideBottom;
		case TokenSideBottom: return TokenSideTop;
	}
	return TokenSideLeft;
}

- (BOOL)appliesToSameColorRuleWithNeighbour:(Token *)oppositeNeighbourToken {
	return self.token.color == oppositeNeighbourToken.color;
}

- (BOOL)appliesToSameShapeRuleWithNeighbour:(Token *)oppositeNeighbourToken {
	return self.token.shape == oppositeNeighbourToken.shape;
}

@end