#import <Foundation/NSString.h>
#import <math.h>
#import "Circle.h"

#define PI 3.14159

@implementation Circle

- (void)setSize:(NSSize)newsize
{
    double x = newsize.width;
    double y = newsize.height;
    radius = sqrt(x * x + y * y);
}

- (double)area
{
    return PI * radius * radius;
}

- (NSString*)figureName
{
    return @"Circle";
}

- (NSString*)stringOfSize
{
    return [NSString stringWithFormat:@"radius=%.2f", radius];
}

@end
