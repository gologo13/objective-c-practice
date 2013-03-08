#import "testObj.h"

int main(void)
{
    int (*funcp)(id, SEL);

    id obj = [[testObj alloc] init];
    funcp = (int (*)(id, SEL))[obj methodForSelector:@selector(testMethod)];
    int v = [obj testMethod];
    for (int i = 0; i < LOOP; ++i)
        for (int j= 0; j < 20000; ++j)
            v += (*funcp)(obj, @selector(testMethod));
    return (v == 0);
}
