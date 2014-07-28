//
//  XYZCreateCheckInViewController.m
//  JustCheckIn
//
//  Created by Campbell Weaver on 7/23/14.
//  Copyright (c) 2014 Campbell Weaver. All rights reserved.
//

#import "XYZCreateCheckInViewController.h"

@interface XYZCreateCheckInViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *date_time;
@property (weak, nonatomic) IBOutlet UITextField *Description;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation XYZCreateCheckInViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.doneButton) return;
    if (self.Description.text.length > 0) {
        self.checkIn = [[XYZCheckIn alloc] init];
        self.checkIn.description = self.Description.text;
        self.checkIn.completed = NO;
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
