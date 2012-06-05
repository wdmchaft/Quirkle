#import <Foundation/Foundation.h>
#import "Token.h"

@class Token;


@interface GameRule : NSObject
@property (nonatomic, strong) Token *token;


- (id)initWithToken:(Token *)token;
- (BOOL)appliesToToken:(Token *)otherToken atSide:(TokenSide)side;


@end
