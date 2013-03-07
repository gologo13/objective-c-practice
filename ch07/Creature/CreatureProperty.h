#import <Foundation/Foundation.h>

@interface Creature : NSObject
{
    NSString *name;
    int hitPoint;
    int magicPoint;
}
- (id)initWithName:(NSString*)str;

@property int hitPoint;
@property(readonly) NSString *name;
@property int level;

@end
