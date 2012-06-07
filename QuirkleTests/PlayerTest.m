#import "Player.h"
#import "Token.h"

@interface PlayerTest : SenTestCase
@end

@implementation PlayerTest {
}

- (void)testPulledTokensRemainAtPlayer {
	Player *player = [[Player alloc] init];
	id token = [OCMockObject niceMockForClass:[Token class]];
	[player pullToken:token];
	expect(player.tokens).toContain(token);
}
@end