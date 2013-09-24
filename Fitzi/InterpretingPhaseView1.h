//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterpretingPhaseView_Athelete.h"

@interface InterpretingPhaseView1 : UIView
{
    //InterpretingPhaseView2 *evaluationView;
    InterpretingPhaseView_Athelete* athelete;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
