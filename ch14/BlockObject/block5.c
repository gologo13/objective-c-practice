#include <stdio.h>
#include <Block.h>

void print(int (^block)(void))
{
    printf("%d\n", block());
}

int (^g)(void) = ^{ return 100; };

void func1(int n)
{
    int (^b1)(void) = ^{ return n; };
    print(b1);
    // this code is dangerous. b1 is released if func1 returns. so, g becomes undefined
    //g = b1;
    g = Block_copy(b1);
}

void func2(int n)
{
    int a = 10;
    int (^b2)(void) = ^{ return n * a; };
    print(b2);
}

int main(int argc, const char *argv[])
{
    print(g); // 100
    func1(5); // 5
    print(g); // 5
    func2(5); // 50
    print(g); // 50???why??? -> 5 come on!!!
    return 0;
}
