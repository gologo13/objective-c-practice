#import "MuteVolume.h"
#import <stdio.h>

int main(void)
{
    char buf[8];

    id v = [[MuteVolume alloc] initWithMin:0 max:10 step:2];
    while (scanf("%s", buf) > 0) {
        switch (buf[0]) {
            case 'u': [v up]; break;
            case 'd': [v down]; break;
            case 'm': [v mute]; break;
            case 'q': return 0;
        }
        printf("Volume = %d\n", [v value]);
    }
    return 0;
}
