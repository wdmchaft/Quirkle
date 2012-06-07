#import "NSMutableArray+Shuffling.h"

@interface NSArrayShuffleTest : SenTestCase
@end

@implementation NSArrayShuffleTest {
	NSMutableArray *array;
}

- (void)setUp {
	array = [NSMutableArray arrayWithObjects:@"foo", @"bar", @"baz", nil];
}

- (void)testArrayContentRemainsSame {
	[array shuffle];
	expect(array).toContain(@"bar");
	expect(array).toContain(@"baz");
	expect(array).toContain(@"foo");
}

//- (void)testFirstObjectIsNowAtAnotherPosition {
//	[array shuffle];
//	expect([array objectAtIndex:0]).Not.toEqual(@"foo");
//}

@end