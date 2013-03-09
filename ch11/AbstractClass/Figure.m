#import "Figure.h"
#import <Foundation/NSString.h>

@implementation Figure

@synthesize location;

- (void)setSize:(NSSize)newsize
{
}

- (double)area
{
    return 0.0;
}

- (NSString*)figureName
{
    return nil;
}

- (NSString*)stringOfSize
{
    return nil;
}

- (NSString*)description
{
    NSPoint loc = self.location;
    return [NSString stringWithFormat: 
                                 @"%@: location=(%.2f, %.2f), %@, area=%.2f",
        [self figureName], loc.x, loc.y, [self stringOfSize], [self area]];
}

@end
