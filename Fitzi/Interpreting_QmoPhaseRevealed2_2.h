//
//  Interpreting_QmoPhaseRevealed2_2.h
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterpretingPhaseView2.h"

@interface Interpreting_QmoPhaseRevealed2_2 : UIView
{
    InterpretingPhaseView2* intPhaseView2;
}
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
