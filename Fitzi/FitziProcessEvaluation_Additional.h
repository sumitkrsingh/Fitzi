//
//  FitziProcessEvaluation_Additional.h
//  Fitzi
//
//  Created by MacBook on 11/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziProcessEvaluation1.h"
#import "RichTextEditor.h"
#import "PopupView.h"

@interface FitziProcessEvaluation_Additional : UIView <RichTextEditorDataSource>
{
    FitziProcessEvaluation1* fitziProcessEvaluation1;
    NSArray *popupText;
    NSArray *popupTitle;
}
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipwUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;
@property (weak, nonatomic) IBOutlet UILabel *lblPopup1;
@property (weak, nonatomic) IBOutlet UILabel *lblPopup2;
@property (weak, nonatomic) IBOutlet UILabel *lblPopup3;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;
- (IBAction)showPopUpWithText:(id)sender;
- (void) preparePopupArray;

@end
