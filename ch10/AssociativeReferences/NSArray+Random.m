#import "NSArray+Random.h"
#import <objc/runtime.h>

@implementation NSArray (Random)

static char prevKey;

static int random_value(void)
{
    static unsigned long rnd = 201008;
    rnd = rnd * 1103515245UL + 12345;
    return (int)((rnd >> 16) & 0x7fff);
}

- (id)anyOne
{
    id item;
    NSUInteger count = [self count];
    if (count == 0)
        return nil;
    if (count == 1)
        return [self lastObject];
    else {
        id prev = objc_getAssociatedObject(self, &prevKey);
        NSUInteger index = random_value() % count;
        item = [self objectAtIndex:index];
        if (prev == item) {
            if (index++ == count)
                index = 0;
            item = [self objectAtIndex:index];
        }
    }
    objc_setAssociatedObject(self, &prevKey, item, OBJC_ASSOCIATION_RETAIN);
    return item;
}

@end
