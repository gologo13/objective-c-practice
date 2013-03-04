#import <Foundation/NSObject.h>
#import <stdio.h>

@interface People : NSObject
{
    const char *name;
    __weak People *friend;
}
- (id)initWithName:(const char*)p;
- (void)setFriend:(id)obj;
- (const char*)nameOfFriend;
@end

@implementation People
- (id)initWithName:(const char*)p
{
    self = [super init];
    if (self != nil) {
        name = p;
        friend = nil;
    }
    return self;
}

- (void)setFriend:(id)obj
{
    friend = obj;
}

- (const char*)nameOfFriend
{
    if (friend == nil)
        return "none";
    return friend->name;
}
@end

int main()
{
    People *a = [[People alloc] initWithName:"Alice"];
    printf("Friend: %s\n", [a nameOfFriend]);
    @autoreleasepool {
        People *b = [[People alloc] initWithName:"Bob"];
        [a setFriend:b];
        printf("Friend: %s\n", [a nameOfFriend]);
        b = nil;
    }
    printf("Friend: %s\n", [a nameOfFriend]);
    return 0;
}
