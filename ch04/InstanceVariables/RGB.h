#import <Foundation/NSObject.h>

@interface RGB : NSObject
{
    unsigned char red, blue, green;
}

- (id)initWithRed:(int)r green:(int)g blue:(int)b;
- (id)blendColor:(RGB*)color;
- (void)print;
@end