#import <Foundation/Foundation.h>

int main()
{
    NSString *euro = @"Euro=\u20ac";
    NSString *clef = @"G-clef=\U0001d11e";
    NSLog(euro);
    NSLog(clef);
    return 0;
}
