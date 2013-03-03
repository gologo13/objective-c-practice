#import "FractionRegister.h"
#import <stdio.h>

@implementation FractionRegister

- (id)init
{
    self = [super init];
    if (self == nil) {
        current = prev = nil;
    }
    return self;
}

- (void)dealloc
{
    [current release];
    [prev release];
    [super dealloc];
}

- (Fraction*)currentValue
{
    return current;
}

- (void)setCurrentValue:(Fraction*)val
{
    [val retain];
    [current release];
    current = val;
    [prev release];
    prev = nil;
}

- (BOOL)undoCalc
{
    if (prev == nil)
        return NO;
    [current release];
    current = prev;
    [prev release];
    prev = nil;
    return YES;
}

- (void)calculate:(char)op with:(Fraction*)arg
{
    Fraction* ret = nil;
    if (current != nil && arg != nil) {
        switch (op) {
            case '+':
                ret = [current add:arg];
                break;
            case '-':
                ret = [current sub:arg];
                break;
            case '*':
                ret = [current mul:arg];
                break;
            case '/':
                ret = [current div:arg];
                break;
            default: // error
                break;
        }
    }

    if (ret != nil) {
        [ret retain];
        [prev release];
        prev = current;
        current = ret;
    } else {
        printf("Illegal Operation¥n");
    }
}

@end
