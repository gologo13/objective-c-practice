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

- (Fraction*)currentValue
{
    return current;
}

- (void)setCurrentValue:(Fraction*)val
{
    current = val;
    prev = nil;
}

- (BOOL)undoCalc
{
    if (prev == nil)
        return NO;
    current = prev;
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
        prev = current;
        current = ret;
    } else {
        printf("Illegal Operation¥n");
    }
}

@end
