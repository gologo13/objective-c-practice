#import <Foundation/Foundation.h>

// Person
@interface Person : NSObject
{
    NSString *name;
    NSString *email;
    int age;
}
- (void)setName:(NSString*)aName;
- (NSString*)email;
- (id)initWithName:(NSString*)aName age:(int)anAge;
@end

@implementation Person
- (id)initWithName:(NSString*)aName age:(int)anAge
{
    if ((self = [super init]) != nil) {
        name = aName;
        age  = anAge;
    }
    return self;
}
- (void)setName:(NSString*)aName
{
    name = aName;
}
- (NSString*)email
{
    return email;
}
@end

// WorkingGroup
@interface WorkingGroup : NSObject
{
    Person *leader;
    NSMutableArray *members;
}
- (id)initWithLeader:(Person*)aPerson;
- (void)addMember:(Person*)aPerson;
@end

@implementation WorkingGroup
- (id)initWithLeader:(Person*)aPerson
{
    if ((self = [super init]) != nil) {
        leader = aPerson;
        members = [NSMutableArray array];
    }
    return self;
}
- (void)addMember:(Person*)aPerson
{
    [members addObject:aPerson];
    NSLog(@"%@: %@", [aPerson valueForKey:@"name"], [aPerson valueForKey:@"age"]);
}
@end

int main()
{
    @autoreleasepool {
        id leader = [[Person alloc] initWithName:@"Taro" age:10];
        id staff1 = [[Person alloc] initWithName:@"Jiro" age:11];
        id staff2 = [[Person alloc] initWithName:@"Saburo" age:12];
        WorkingGroup *group = [[WorkingGroup alloc] initWithLeader:leader];
        [group addMember:staff1];
        [group addMember:staff2];
    
        NSLog(@"%@", [group valueForKey:@"members"]);
    
        NSLog(@"1: %@", [group valueForKeyPath:@"leader.name"]);
        NSLog(@"2: %@", [group valueForKeyPath:@"members.name"]);
        NSLog(@"3: %@", [group valueForKeyPath:@"members.age"]);
        [group setValue:@"Yonro" forKeyPath:@"leader.name"];
        [group setValue:[NSNumber numberWithInt:10]
            forKeyPath:@"members.age"];
        NSLog(@"4: %@", [group valueForKeyPath:@"leader.name"]);
        NSLog(@"5: %@", [group valueForKeyPath:@"members.age"]);
    }

    return 0;
}
