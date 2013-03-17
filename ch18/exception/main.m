#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        id array = [NSMutableArray array];

        @try {
            if (argc == 1)
                array = [array objectAtIndex:0];
            else
                [array addObject:nil];
            NSLog(@"success\n");
        }
        @catch (NSException *e) {
            NSString *name = [e name];
            NSLog(@"Name: %@\n", name);
            NSLog(@"Reason: %@\n", [e reason]);
            if ([name isEqualToString:NSRangeException])
                NSLog(@"Exception was caught successfully.\n");
            else
                [e raise];
        }
        NSLog(@"main exit");
    }

    return 0;
}
