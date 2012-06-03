#import "Row.h"
#import "Token.h"

@interface RowTest : SenTestCase
@end

@implementation RowTest {
	Row *row;
}

- (void)setUp {
	row = [[Row alloc] init];
}

- (void)testHasTokens {
	Token *token = [[Token alloc] initWithColor:TokenColorYellow shape:TokenShapeCircle];
	[row addToken:token];
	expect(row.tokens).toContain(token);
}

- (void)testAddsOnlyTokensWithSameColor {
//	Token *yellowToken = [[Token alloc] initWithColor:TokenColorYellow];
}

@end