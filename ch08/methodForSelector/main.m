#import <Foundation/NSObject.h>
#import <stdio.h>

@interface Foo : NSObject
- (id)initWithTitle:(int)t;
@property(nonatomic) int title;
@end

@implementation Foo
- (id)initWithTitle:(int)t
{
    if ((self = [super init]) != nil) {
        title = t;
    }
    return self;
}
@synthesize title; // generate a setter and getter
@end


int main(void)
{
    Foo* foo = [[Foo alloc] initWithTitle:10];
    printf("title: %d\n", foo.title);

    SEL method = @selector(setTitle:);
    IMP fp = [foo methodForSelector:method];
    (*fp)(foo, @selector(setTitle:), 20); // call [foo setTitile:20];

    printf("title: %d\n", foo.title);

    return 0;
}
