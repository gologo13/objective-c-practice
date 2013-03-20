#import <Foundation/Foundation.h>
#import <stdio.h>
#import <stdlib.h>
#import <unistd.h>

NSMutableArray *MyList;

int main(void)
{
    const int Tasks = 10;
    srandom((unsigned)getpid());

    @autoreleasepool {
        int i;
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        MyList = [[NSMutableArray alloc] init]; // MyList is declared as a global variable

        for (i = 0; i < Tasks; ++i) {
            NSTimeInterval interval = (double)(random() % 0x7f) / 256.0;
            NSBlockOperation *opr = [NSBlockOperation blockOperationWithBlock: ^{
                NSNumber *obj = [NSNumber numberWithInt:i]; // convenient ctor.
                [NSThread sleepForTimeInterval:interval];
                @synchronized(MyList) {
                    [MyList addObject:obj];
                }
            }];
            [queue addOperation:opr];
        }
        [queue waitUntilAllOperationsAreFinished];

        for (id obj in MyList) {
            printf(" %d", [obj intValue]); // print values in order that a NSOperation object is added to the list
        }
        printf("\n");
    }

    return 0;
}
