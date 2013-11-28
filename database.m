ios-programs
============
#import "database.h"

@implementation database

@synthesize uid,name,course;

-(id)initWithUid:(int)suid name:(NSString *)sname course:(NSString *)scourse
{
    [self setUid:suid];
    [self setName:sname];
    [self setCourse:scourse];
    return 0;
}

@end

