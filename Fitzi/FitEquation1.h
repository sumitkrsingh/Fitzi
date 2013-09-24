//
//  FitEquation1.h
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitEquationView.h"
#import "FitEquation1_Additional.h"
#import "CopiedTextVC.h"
#import "UIViewController+MJPopupViewController.h"

@interface FitEquation1 : UIView
{
    FitEquationView *equationView;
    FitEquation1_Additional* fitEquation1_Additional;
    UIPopoverController *popoverController;
    CopiedTextVC *copiedTxtPopverVC;
   
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;
@property (weak, nonatomic) IBOutlet UITextView *contentTV;


- (IBAction)showhighlitedText:(id)sender;
- (IBAction)btnUnderlineAction:(id)sender;
- (IBAction)btnHighlightAction:(id)sender;
- (void) applySelectedAttributesOnTextView;
- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
