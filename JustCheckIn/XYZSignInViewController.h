//
//  XYZSignInViewController.h
//  JustCheckIn
//
//  Created by Campbell Weaver on 7/23/14.
//  Copyright (c) 2014 Campbell Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZSignInViewController : UIViewController<NSURLConnectionDelegate> {

NSMutableData *_responseData;
}
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
