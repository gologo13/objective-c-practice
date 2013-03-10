#import "NSStringReal.h"

@implementation NSString (Real)

- (double)realValue
{
    return [self doubleValue];
}

@end
