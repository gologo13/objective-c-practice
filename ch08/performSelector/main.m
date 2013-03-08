#import <Foundation/NSObject.h>
#import <stdio.h>

@interface A : NSObject
- (void)show;
@end

@implementation A
- (void)show
{
    printf("I'm A\n");
}
@end

int main(void)
{
    id obj = [[A alloc] init];
    SEL method = @selector(show);
    [obj performSelector:method];
    return 0;
}
