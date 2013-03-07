#import "Creature.h"
#import <stdio.h>

int main(void)
{
    Creature* c = [[Creature alloc] initWithName:@"Nike"];
    c.hitPoint = 50;
    printf("%s: HP=%d (LV=%d)\n", [c.name UTF8String], c.hitPoint, c.level);
}
