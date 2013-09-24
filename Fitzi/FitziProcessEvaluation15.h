//
//  FitziProcessEvaluation15.h
//  Fitzi
//
//  Created by MacBook on 06/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitEvolutionView16.h"

@interface FitziProcessEvaluation15 : UIView
{
    FitEvolutionView16 *fitEvolutionView16;
}
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;


@end
