ios-programs
============
#import "databaseoperation.h"

@implementation databaseoperation

//static databaseoperation *db;

sqlite3 *mydb=nil;
sqlite3_stmt *myst=nil;

/*+(databaseoperation *) dbclassm
{
     if(db==nil)
     {
         db=[[databaseoperation alloc]init];
     }
    return db;
}*/

-(id)insert
{
    NSString *dbpath=@"Users/mse/Desktop/ss.sqlite3";
    const char *mydbpath=[dbpath UTF8String];
    if (sqlite3_open(mydbpath, &mydb)==SQLITE_OK)
    {
        NSLog(@"Open Success");
    }
    else
    {
        NSLog(@"fail");
    }
    
    NSString *query=@"insert into sample values(410, 'Pooja', 'MSE');";
    const char *myquery=[query UTF8String];
    
    sqlite3_prepare_v2(mydb, myquery, -1, &myst, NULL);
    
    if(sqlite3_step(myst)==SQLITE_DONE)
    {
        NSLog(@"\nInsert successful\n");
    }
    
    return 0;
    
}

-(id)select
{
    NSString *dbpath=@"Users/mse/Desktop/ss.sqlite3";
    const char *mydbpath=[dbpath UTF8String];
    if (sqlite3_open(mydbpath, &mydb)==SQLITE_OK)
    {
        NSLog(@"Open Success");
    }
    else
    {
        NSLog(@"fail");
    }
    NSString *query=@"select * from sample";
    const char *myquery=[query UTF8String];
    
    sqlite3_prepare_v2(mydb, myquery, -1, &myst, NULL);
    while (sqlite3_step(myst)==SQLITE_ROW)
    {
        int ouid=sqlite3_column_int(myst, 0);
        NSLog(@"uid=%d",ouid);
        
        char * name=(char *) sqlite3_column_text(myst, 1);
        NSString *oname=[[NSString alloc]initWithUTF8String:name];
        NSLog(@"Name=%@",oname);
        
        NSString *ocourse=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(myst, 2)];
        NSLog(@"Course=%@",ocourse);
    }
    
    return 0;
}

-(id)del
{
    NSString *dbpath=@"Users/mse/Desktop/ss.sqlite3";
    const char *mydbpath=[dbpath UTF8String];
    if (sqlite3_open(mydbpath, &mydb)==SQLITE_OK)
    {
        NSLog(@"Open Success");
    }
    else
    {
        NSLog(@"fail");
    }
    
    NSString *query=@"delete from sample where uid=410;";
    const char *myquery=[query UTF8String];
    
    sqlite3_prepare_v2(mydb, myquery, -1, &myst, NULL);
    
    if(sqlite3_step(myst)==SQLITE_DONE)
    {
        NSLog(@"\nDelete successful\n");
    }
    return 0;
}

-(id)update
{
 
    NSString *dbpath=@"Users/mse/Desktop/ss.sqlite3";
    const char *mydbpath=[dbpath UTF8String];
    if (sqlite3_open(mydbpath, &mydb)==SQLITE_OK)
    {
        NSLog(@"Open Success");
    }
    else
    {
        NSLog(@"fail");
    }
    
    NSString *query=@"update sample set course='MSE' where uid=121;";
    const char *myquery=[query UTF8String];
    
    sqlite3_prepare_v2(mydb, myquery, -1, &myst, NULL);
    
    if(sqlite3_step(myst)==SQLITE_DONE)
    {
        NSLog(@"\nUpdate successful\n");
        
    }
    
    return 0;
}

@end
