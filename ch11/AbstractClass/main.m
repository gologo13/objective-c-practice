#import <Foundation/Foundation.h>
#import "Figure.h"
#import "Circle.h"
#import "Rectangle.h"
#import <stdio.h>

BOOL testloop(void)
{
    Figure *fig = nil;
    double x, y, w, h;
    char buf[64];

    do {
        printf("Shape (C=Circle, R=Rectangle, Q=Quit) ?");
        if (scanf("%s", buf) == 0 || buf[0] == 'Q' || buf[0] == 'q')
            return NO;
        if (buf[0] == 'C' || buf[0] == 'c')
            fig = [[Circle alloc] init];
        if (buf[0] == 'R' || buf[0] == 'r')
            fig = [[Rectangle alloc] init];
    } while (fig == nil);

    printf("Location ?");
    scanf("%lf %lf", &x, &y);
    fig.location = NSMakePoint(x, y);
    printf("Size ? ");
    scanf("%lf %lf", &w, &h);
    [fig setSize: NSMakeSize(w, h)];
    printf("%s\n", [[fig description] UTF8String]);
    return YES;
}


int main(void)
{
    BOOL ret = YES;
    do {
        @autoreleasepool {
            ret = testloop();
        }
    } while (ret);
    return 0;
}
