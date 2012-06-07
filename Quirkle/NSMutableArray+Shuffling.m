#import "NSMutableArray+Shuffling.h"


@implementation NSMutableArray (Shuffling)

- (void)shuffle {
	static BOOL seeded = NO;
	if (!seeded) {
		seeded = YES;
		srandom((unsigned int) time(NULL));
	}

	for (NSUInteger i = 0; i < ([self count]); ++i) {
		[self swapLastElementWithElementAtIndex:i];
	}
}

- (void)swapLastElementWithElementAtIndex:(NSUInteger)index {
	NSUInteger nElements = ([self count]) - index;
	NSUInteger n = (NSUInteger) ((random() % nElements) + index);
	[self exchangeObjectAtIndex:index withObjectAtIndex:n];
}


@end