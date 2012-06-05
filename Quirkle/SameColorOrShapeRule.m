#import "SameColorOrShapeRule.h"


@implementation SameColorOrShapeRule

- (BOOL)appliesToToken:(Token *)token atSide:(TokenSide)side {
	return [self isSameColor:token] || [self isSameShape:token];
}

- (BOOL)isSameColor:(Token *)token {
	return self.token.color == token.color;
}

- (BOOL)isSameShape:(Token *)token {
	return self.token.shape == token.shape;
}

@end