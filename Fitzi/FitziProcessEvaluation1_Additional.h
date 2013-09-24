//
//  FitziProcessEvaluation1_Additional.h
//  Fitzi
//
//  Created by MacBook on 12/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziProcessEvaluation2.h"

@interface FitziProcessEvaluation1_Additional : UIView
{
    FitziProcessEvaluation2* fitziProcessEvaluation2;
}
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
