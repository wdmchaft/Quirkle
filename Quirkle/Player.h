#import <Foundation/Foundation.h>

@class Token;
@class Board;


@interface Player : NSObject

@property (nonatomic, strong, readonly) NSArray *tokens;

- (void)pullToken:(Token*)token;
- (void)putTokensToBoard:(Board*)board;

@end
