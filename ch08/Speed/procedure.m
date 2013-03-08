#import "testObj.h"

int main(void)
{
    unsigned long rnd = 201109;
    id obj = [[testObj alloc] init];
    int v = [obj testMethod];
    for (int i = 0; i < LOOP; ++i)
        for (int j= 0; j < 20000; ++j) {
            rnd = rnd * 1103515245UL + 12345;
            v += (rnd & 1) ? 1 : -1;
        }
    return (v == 0);
}
