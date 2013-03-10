#import <Foundation/NSObject.h>
#import "RealNumber.h"

@class NSString;

@interface Fraction : NSObject<RealNumber>
{
    int sgn;
    int num;
    int den;
}

+ (id)fractionWithNumerator:(int)n denominator:(int)d;
- (id)initWithNumerator:(int)n denominator:(int)d;
- (Fraction *)add:(Fraction *)obj;
- (Fraction *)sub:(Fraction *)obj;
- (Fraction *)mul:(Fraction *)obj;
- (Fraction *)div:(Fraction *)obj;
- (NSString *)description;

@end
