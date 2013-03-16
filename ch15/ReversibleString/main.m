#import <Foundation/NSString.h>
#import <Foundation/NSMethodSignature.h>
#import <Foundation/NSInvocation.h>
#import <stdio.h>
#import <stdlib.h>

@interface ReversibleString : NSObject
{
    NSString *content;
}
- (id)initWithString:(NSString*)string;
- (id)reversedString;
@end

@implementation ReversibleString

-(id)initWithString:(NSString*)string
{
    if ((self = [super init]) != nil) {
        content = string;
    }
    return self;
}

-(id)reversedString
{
    int len = [content length];
    if (len <= 0)
        return @"";

    unichar *buffer = (unichar*)malloc(sizeof(unichar) * len);
    // null check
    [content getCharacters:buffer range:NSMakeRange(0, len)];

    int i, j;
    for (i = 0, j = len-1; i < j; ++i, --j) {
        unichar tmp = buffer[j];
        buffer[j] = buffer[i];
        buffer[i] = tmp;
    }
    id ret = [NSString stringWithCharacters:buffer length:len];
    free(buffer);
    return ret;
}

-(void)forwardInvocation:(NSInvocation*)anInvocation
{
    NSLog(@"forwardInvocation called: %@", [anInvocation description]);

    SEL sel = [anInvocation selector];
    if ([content respondsToSelector:sel]) {
        NSLog(@"called content");
        [anInvocation invokeWithTarget:content];
    } else {
        NSLog(@"called super");
        [super forwardInvocation:anInvocation];
    }
}

-(BOOL)respondsToSelector:(SEL)aSelector
{
    if ([super respondsToSelector:aSelector])
        return YES;
    if ([self methodForSelector:aSelector] != (IMP)NULL)
        return YES;
    if ([content respondsToSelector:aSelector])
        return YES;
    return NO;
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector
{
    if ([super respondsToSelector:aSelector])
        return [super methodSignatureForSelector:aSelector];
    return [content methodSignatureForSelector:aSelector];
}

@end

int main(void)
{
    char buf[100];
    id s, a, b, c, d, e;
    @autoreleasepool {
        scanf("%s", buf);
        s = [NSString stringWithUTF8String:buf];
        a = [[ReversibleString alloc] initWithString:s];
        b = [[ReversibleString alloc] initWithString:@"Reverse?"];
        printf("a: %s\n", [a UTF8String]);
        printf("b: %s\n", [b UTF8String]);

        c = [[a reversedString] stringByAppendingString: b];
        printf("c: %s\n", [c UTF8String]);
        d = [[ReversibleString alloc] initWithString:c];
        e = [b stringByAppendingString: [d reversedString]];
        printf("e: %s\n", [e UTF8String]);
    }
    return 0;
}
