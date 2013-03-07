#import "Creature.h"

@implementation Creature

@synthesize name;
@synthesize hitPoint, magicPoint;

@dynamic level;

- (id)initWithName:(NSString*)str
{
    if ((self = [super init]) != nil) {
        name = str;
        hitPoint = magicPoint = 10;
    }
    return self;
}

- (int)level
{
    return (hitPoint + magicPoint) / 10;
}

@end