#import "MuteVolume.h"

@implementation MuteVolume

- (id)initWithMin:(int)a max:(int)b step:(int)s
{
    self = [super initWithMin:a max:b step:s];
    if (self != nil) {
        muting = NO;
    }
    return self;
}

- (int)value
{
    return muting? min : [super value];
}

- (id)mute
{
    muting = !muting;
    return self;
}

@end
