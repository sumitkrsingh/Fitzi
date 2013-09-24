//
//  InterpretingPhaseView_Lifestyle.h
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Interpreting_QmoPhaseRevealed.h"

@interface InterpretingPhaseView_Lifestyle : UIView
{
    Interpreting_QmoPhaseRevealed* qmo;
}
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;


- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;


@end
