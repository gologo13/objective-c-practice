#import <Foundation/NSString.h>

@interface BitPattern : NSString
{
    unsigned char value;
}
- (id)initWithChar:(char)val;
- (NSUInteger)length;
- (unichar)characterAtIndex:(NSUInteger)index;
@end
