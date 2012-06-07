#import <Foundation/Foundation.h>

@class Player;
@class Board;

#define TokenCount 3


@interface Game : NSObject {
	NSMutableArray *_tokens;
	NSMutableArray *_players;
	Board *_board;
}

@property (nonatomic, strong, readonly) NSArray *tokens;
@property (nonatomic, strong, readonly) NSArray *players;
@property (nonatomic, strong) Board *board;

- (void)addPlayer:(Player *)player;
- (void)startGame;

@end