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
+ (void)makeFriends:(People *__strong[])p;
+ (void)printFriends:(People *__const[])p number:(int)n;
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

+ (void)makeFriends:(People *__strong[])p
{
    [p[0] setFriend:p[1]];
    [p[1] setFriend:p[0]];
}

+ (void)printFriends:(People *__const[])p number:(int)n
{
    for (int i = 0; i < n; ++i)
        printf("%d: %s\n", i, [p[i] nameOfFriend]);
}
@end

int main(void)
{
    People *a[4];
    static const char* names[4] = {"Bob", "Lobin", "Mike", "Cindy"};
    @autoreleasepool {
        for (int i = 0; i < 4; ++i) {
            a[i] = [[People alloc] initWithName:names[i]];
        }
        [People makeFriends: &a[0]];
        [People makeFriends: &a[2]];
    }
    [People printFriends:a number:4];

    return 0;
}
