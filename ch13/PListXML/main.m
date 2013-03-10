#import <Foundation/Foundation.h>

int main(void)
{
    // write
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:@1 forKey:@"first"];
    [dict setObject:@2 forKey:@"second"];
    [dict setObject:@3 forKey:@"third"];
    NSDictionary* d = [NSDictionary dictionaryWithDictionary:dict];
    if (![d writeToFile:@"sample.plist" atomically:YES]) {
        NSLog(@"%@", @"Failed to write a file: sample.plist");
        return 1;
    }

    // read
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
