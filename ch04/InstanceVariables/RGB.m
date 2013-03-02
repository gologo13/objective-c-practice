#import "RGB.h"
#import <stdio.h>

static unsigned char roundUChar(int c)
{
    if (c < 0) c = 0;
    if (c > 255) c = 255;
    return c;
}

@implementation RGB

- (id)initWithRed:(int)r green:(int)g blue:(int)b
{
    if ((self = [super init]) != nil) {
        red = roundUChar(r);
        blue = roundUChar(b);
        green = roundUChar(g);
    }
    return self;
}

- (id)blendColor:(RGB*)color
{
    red = ((unsigned int)red + color->red) / 2;
    green = ((unsigned int)green + color->green) / 2;
    blue = ((unsigned int)blue + color->blue) / 2;
    return self;
}

- (void)print
{
    printf("(%d, %d, %d)\n", red, green, blue);
}

@end
