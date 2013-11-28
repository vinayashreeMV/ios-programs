ios-programs
============
#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "database.h"

@interface databaseoperation : NSObject

//+(databaseoperation *) dbclassm;

-(id)insert;
-(id)select;
-(id)del;
-(id)update;

@end
