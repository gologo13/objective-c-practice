#import <Foundation/Foundation.h>

int main(void)
{
    @autoreleasepool {
        id date = [NSDate date];
        id str = [NSString stringWithFormat:@"Date=%@", date];
        printf("%s\n", [str UTF8String]);
        str = [NSString localizedStringWithFormat:@"Date=%@", date];
        printf("%s\n", [str UTF8String]);
    }

    return 0;
}
