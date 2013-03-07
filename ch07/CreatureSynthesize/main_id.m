#import "Creature.h"
#import <stdio.h>

int main(void)
{
    id c = [[Creature alloc] initWithName:@"Bob"];
    printf("level: %d", [c level]);
    puts("");
    printf("hitPoint: %d", [c hitPoint]);
    puts("");
    printf("skill: %d", [c skill]);
    puts("");
    // error
    //printf("ability: %d", [c ability]);
    //puts("");
    return 0;
}
