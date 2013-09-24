//
//  InterpretingPhaseView_Athelete.h
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterpretingPhaseView_Lifestyle.h"

@interface InterpretingPhaseView_Athelete : UIView
{
    InterpretingPhaseView_Lifestyle* lifeStyle;
}
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;



- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;




@end
