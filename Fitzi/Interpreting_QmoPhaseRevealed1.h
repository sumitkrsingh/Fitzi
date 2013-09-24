//
//  Interpreting_QmoPhaseRevealed1.h
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Interpreting_QmoPhaseRevealed1_2.h"

@interface Interpreting_QmoPhaseRevealed1 : UIView
{
    Interpreting_QmoPhaseRevealed1_2* qmo1_2;
}
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
