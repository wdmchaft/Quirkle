#import <Foundation/Foundation.h>

typedef enum {
	TokenColorYellow,
	TokenColorBlue,
	TokenColorRed,
	TokenColorGreen,
	TokenColorOrange,
	TokenColorPurple
} TokenColor;

typedef enum {
	TokenShapeCircle,
	TokenShapeSquare,
	TokenShapeTriangle,
	TokenShapeFlower,
	TokenShapeStar,
	TokenShapeCrystal
} TokenShape;

@interface Token : NSObject

@property (nonatomic, assign) TokenColor color;
@property (nonatomic, assign) TokenShape shape;

- (Token *)initWithColor:(TokenColor)color shape:(TokenShape)shape;

- (void)addNeighbour:(Token *)token;
- (BOOL)isNeighbourOf:(Token *)otherToken;
@end