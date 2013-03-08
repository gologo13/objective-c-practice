#import <Foundation/Foundation.h>

@interface X : NSObject
-(id)initWithS:(NSString*)str;
@property NSString* s;
@end

@implementation X
@synthesize s;
-(id)initWithS:(NSString*)str
{
    if ((self = [super init]) != nil) {
        s = str;
    }
    return self;
}
@end

int main(void)
{
    NSArray* arr = [[NSArray alloc] initWithObjects: 
                              [[X alloc] initWithS:@"first"]
                            , [[X alloc] initWithS:@"second"]
                            , [[X alloc] initWithS:@"third"]
                            , nil];
    for (X* e in arr) {
        NSLog(@"%@", e.s);
    }

    NSEnumerator* enumerator = [arr reverseObjectEnumerator];
    for (X* e in enumerator) {
        NSLog(@"%@", e.s);
    }


    return 0;
}
