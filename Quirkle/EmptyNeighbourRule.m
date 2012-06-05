#import "EmptyNeighbourRule.h"


@implementation EmptyNeighbourRule {
}

- (BOOL)appliesToToken:(Token *)token atSide:(TokenSide)side {
	return ([self.token neighbourAtSide:side]) == nil;
}


@end