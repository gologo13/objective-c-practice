#import "Counter.h"

@implementation Counter
@synthesize count;

-(id)init
{
    if ((self = [super init]) != nil) {
        count = 0;

        _lock = [[NSLock alloc] init];
        [NSThread detachNewThreadSelector:@selector(countUp)
                                 toTarget:self
                               withObject:self];
        [NSThread detachNewThreadSelector:@selector(countUp)
                                 toTarget:self
                               withObject:self];
        [NSThread sleepForTimeInterval:0.5];
    }
    return self;
}

-(void)countUp
{
    @synchronized(self) {
        NSLog(@"I'm a child thread. countUp: %d -> %d\n", 
                count, count + 1);
        ++count;
    }
    [NSThread exit];
}

-(void)dealloc
{
    NSLog(@"I'm a main thread. Finally, my count is %d\n", count);
}

@end
