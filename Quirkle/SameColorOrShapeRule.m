#import "SameColorOrShapeRule.h"


@implementation SameColorOrShapeRule

- (BOOL)appliesToToken:(Token *)otherToken atSide:(TokenSide)side {
	return [self isSameColor:otherToken] || [self isSameShape:otherToken];
}

- (BOOL)isSameColor:(Token *)token {
	return self.token.color == token.color;
}

- (BOOL)isSameShape:(Token *)token {
	return self.token.shape == token.shape;
}

@end