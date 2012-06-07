#import <Foundation/Foundation.h>

@class Token;


@interface Player : NSObject

@property (nonatomic, strong, readonly) NSArray *tokens;

- (void)pullToken:(Token*)token;

@end
