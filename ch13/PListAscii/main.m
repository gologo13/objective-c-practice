#import <Foundation/Foundation.h>

int main(void)
{
    NSError *error;
    NSString* plist = [NSString stringWithContentsOfFile:@"sample.plist"
                        encoding:NSASCIIStringEncoding
                        error:&error];
    if (!plist && error) {
        NSLog(@"%@: %@", @"Failed to read a file", @"sample.plist");
        return 1;
    }
    id obj = [plist propertyList];
    NSLog(@"%@", [obj description]);

    return 0;
}
