//
//  FitziProcessEvaluation8.h
//  Fitzi
//
//  Created by MacBook on 06/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziProcessEvaluation9.h"

@interface FitziProcessEvaluation8 : UIView
{
    FitziProcessEvaluation9 *fitziProcessEvaluation9;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;


@end
