//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Troubleshooting5.h"

@interface Troubleshooting4 : UIView
{
    Troubleshooting5 *evaluationView;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
