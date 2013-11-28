ios-programs
============
#import "ViewController.h"
#import "databaseoperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    databaseoperation *obj=[[databaseoperation alloc]init];
    [obj select];
    [obj insert];
    [obj select];
    [obj del];
    [obj select];
    [obj update];
    [obj select];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
