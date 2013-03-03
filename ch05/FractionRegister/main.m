#import <Foundation/NSString.h>
#import <Foundation/NSAutoreleasePool.h>
#import <stdio.h>
#import <ctype.h>
#import "FractionRegister.h"
#import "Fraction.h"

#define BUFSIZE 80

static Fraction *getFraction(const char *buf)
{
    printf("getFraction: start\n");
    int a, b, c;
    if (sscanf(buf, "%d'%d/%d", &a, &b, &c) == 3) {
        b = (a > 0) ? (b + a * c) : (-b + a * c);
    } else if (sscanf(buf, "%d/%d", &b, &c) != 2) {
        if (sscanf(buf, "%d", &b) == 1) {
            c = 1;
        } else {
            return nil;
        }
    }
    printf("getFraction: %d/%d\n", b, c);
    printf("getFraction: teminate\n");
    return [Fraction fractionWithNumerator:b denominator:c];
}

static Fraction *readFraction(FILE *fp)
{
    printf("readFraction: start\n");
    char buf[BUFSIZE];
    Fraction *frac = nil;

    for ( ; ; ) {
        if (fgets(buf, BUFSIZE, fp) == NULL)
            return nil;
        if ((frac == getFraction(buf)) != nil)
            break;
    }
    printf("readFraction: teminate\n");
    return frac;
}

int main()
{
    char com[BUFSIZE], cc;
    BOOL contflag = YES;
    FractionRegister *reg;
    Fraction *val;

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    reg = [[[FractionRegister alloc] init] autorelease];

    while (contflag) {
        NSAutoreleasePool *tmppool = [[NSAutoreleasePool alloc] init];
        printf("? ");
        if ((val = readFraction(stdin)) != nil) {
            [reg setCurrentValue:val];
        } else {
            contflag = NO;
        }

        printf("======0\n");
        while (contflag) {
            char *ret = fgets(com, BUFSIZE, stdin);
            if (ret == NULL || (cc = tolower(com[0])) == 'q') {
                contflag = NO;
                break;
            }

            printf("======1\n");
            if (cc == 'c') {
                printf("main: clear\n");
                break;
            }

            printf("======2\n");
            if (cc == '+' || cc == '-' || cc == '*' || cc == '/') {
                if ((val = getFraction(com+1)) == nil) {
                    val = readFraction(stdin);
                }
                if (val == nil) {
                    contflag = NO;
                    break;
                }
                [reg calculate:cc with:val];
            } else if (cc == 'u') {
                if (![reg undoCalc]) {
                    printf("Can't undo\n");
                }
            } else {
                printf("Illegal operator\n");
                continue;
            }
            printf("= %s\n",
                    [[[reg currentValue] description] UTF8String]);
        }
        [tmppool release];
    }
    [pool release];
    return 0;
}
