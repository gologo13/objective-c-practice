#import <Foundation/Foundation.h>
#import <stdio.h>
#import <stdlib.h>

#define MASS 2000
#define ARRAYSIZE (1 << 6)
#define ARRAYMASK (ARRAYSIZE - 1)
#define LOOP 1500
#define ACCIDENT 0x0F

id buf[ARRAYSIZE];

@interface Cell : NSObject
{
    id next;
    char mass[MASS];
}
+ (Cell*)cellWithNext:(id)obj;
@end

@implementation Cell
- (id)initWithNext:(id)obj
{
    self = [super init];
    next = [obj retain];
    return self;
}

+ (Cell*)cellWithNext:(id)obj
{
    return [[[self alloc] initWithNext:obj] autorelease];
}

- (void)dealloc
{
    [next release];
    [super dealloc];
}
@end

int main(void)
{
    int i, j;

    srandom(12345);
    for (i = 0; i < LOOP; ++i) {
        @autoreleasepool {
            for (j = 0; j < LOOP; ++j) {
                int idx = random() & ARRAYMASK;
                if (buf[idx] != nil && (random() & ACCIDENT) == 0) {
                    [buf[idx] release];
                    buf[idx] = nil;
                } else {
                    id t = buf[idx];
                    buf[idx] = [[Cell cellWithNext:t] retain];
                    [t release];
                }
            }
        }
    }
    return 0;
}
