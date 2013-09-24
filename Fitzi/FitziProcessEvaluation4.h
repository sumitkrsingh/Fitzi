//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziProcessEvaluation5.h"
#import "PopupView.h"

@interface FitziProcessEvaluation4 : UIView
{
    FitziProcessEvaluation5 *fitziEvolutionView;
    NSArray *popupText;
    NSArray *popupTitle;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;
@property (weak, nonatomic) IBOutlet UIButton *lblPopup1;
@property (weak, nonatomic) IBOutlet UILabel *lblPopup2;
@property (weak, nonatomic) IBOutlet UILabel *lblPopup3;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;
- (IBAction)showPopUpWithText:(id)sender;
- (void) preparePopupArray;

@end
