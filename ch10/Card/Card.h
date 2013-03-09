#import <Foundation/NSObject.h>

@interface Card : NSObject
- (void)methodA;
- (void)methodB;
- (void)methodC;
@end

@interface Card (Display)
- (void)methodP;
@end

@interface Card (Sort)
- (void)methodX;
- (void)methodY;
@end
