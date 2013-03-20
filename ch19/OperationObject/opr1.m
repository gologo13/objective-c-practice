#import <Foundation/Foundation.h>
#import <stdio.h>
#import <stdlib.h>
#import <unistd.h>

NSMutableArray *MyList;

@interface MyOperation : NSOperation
{
    int number;
    NSTimeInterval interval;
}
- (id)initWithName:(int)sn;
- (void)main;
@end

@implementation MyOperation

- (id)initWithName:(int)sn
{
    if ((self = [super init]) != nil) {
        number = sn;
        interval = (double)(random() % 0x7f) / 256.0;
        NSLog(@"NSOperation generated: %d", number);
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"Release: %d", number);
}

- (void)main
{
    @try {
        @autoreleasepool {
            NSNumber *obj = [NSNumber numberWithInt: number]; // convenient ctor.
            [NSThread sleepForTimeInterval:interval];
            @synchronized(MyList) {
                [MyList addObject:obj];
            }
        }
    }
    @catch (...) {
    }

}

@end

int main(void)
{
    const int Tasks = 10;
    srandom((unsigned)getpid());

    @autoreleasepool {
        int i;
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        MyList = [[NSMutableArray alloc] init]; // MyList is declared as a global variable

        for (i = 0; i < Tasks; ++i) {
            NSOperation *opr = [[MyOperation alloc] initWithName:i];
            [queue addOperation:opr];
        }

        [NSThread sleepForTimeInterval:2.0]; // error may occur in the following codes if we don't wait

        for (id obj in MyList) {
            printf(" %d", [obj intValue]); // print values in order that a NSOperation object is added to the list
        }
        printf("\n");
    }

    return 0;
}
