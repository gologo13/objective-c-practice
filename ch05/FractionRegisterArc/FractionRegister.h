#import <Foundation/NSObject.h>
#import "Fraction.h"

@interface FractionRegister : NSObject
{
    Fraction* current;
    Fraction* prev;
}

- (id)init;
- (Fraction*)currentValue;
- (void)setCurrentValue:(Fraction*)val;
- (BOOL)undoCalc;
- (void)calculate:(char)op with:(Fraction*)arg;

@end
