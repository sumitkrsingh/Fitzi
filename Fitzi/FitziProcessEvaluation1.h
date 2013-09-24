//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziProcessEvaluation2.h"
#import "PopupView.h"
#import "FitziProcessEvaluation1_Additional.h"
#import "RichTextEditor.h"
#import "PopupView.h"

@interface FitziProcessEvaluation1 : UIView <RichTextEditorDataSource>
{
    FitziProcessEvaluation2 *fitzProcessEval1;
    FitziProcessEvaluation1_Additional* fitziProcessEvaluation1_Additional;
    NSArray *popupText;
    NSArray *popupTitle;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;
- (IBAction)showPopUpWithText:(id)sender;
- (void) preparePopupArray;

@end
