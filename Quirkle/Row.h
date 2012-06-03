#import <Foundation/Foundation.h>

@class Token;
@interface Row : NSObject

@property (nonatomic, strong, readonly) NSArray *tokens;

- (void)addToken:(Token *)token;

@end