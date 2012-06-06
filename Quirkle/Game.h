#import <Foundation/Foundation.h>

@class Player;

#define TokenCount 3


@interface Game : NSObject

@property (nonatomic, strong, readonly) NSArray *tokens;
@property (nonatomic, strong, readonly) NSArray *players;

- (void)addPlayer:(Player *)player;

@end