#import "Fraction.h"
#import <stdio.h>

int main()
{
    id f,g;
    f = [[Fraction alloc] initWithNumerator:1 denominator:2];
    g = [[Fraction alloc] initWithNumerator:1 denominator:3];
    printf("add: %s\n", (char*)[[[f add:g] description] UTF8String]);
    printf("sub: %s\n", (char*)[[[f sub:g] description] UTF8String]);
    printf("mul: %s\n", (char*)[[[f mul:g] description] UTF8String]);
    printf("div: %s\n", (char*)[[[f div:g] description] UTF8String]);

    return 0;
}
