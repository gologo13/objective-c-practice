#import "testObj.h"

@implementation testObj
- (int)testMethod
{
    static unsigned long rnd = 201109;
    rnd = rnd * 1103515245UL + 12345;
    return (rnd & 1) ? 1 : -1;
}
@end
