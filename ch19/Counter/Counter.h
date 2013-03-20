#import <Foundation/Foundation.h>

@interface Counter : NSObject
{
    NSLock *_lock;
}
-(void)countUp;
-(void)dealloc;
@property(readonly) int count;
@end
