#import "EmptyNeighbourRule.h"


@implementation EmptyNeighbourRule {
}

- (BOOL)appliesToToken:(Token *)otherToken atSide:(TokenSide)side {
	return ([self.token neighbourAtSide:side]) == nil;
}


@end