//
//  FitEvolutionView_Additional.h
//  Fitzi
//
//  Created by MacBook on 10/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitEquation1.h"
#import "CopiedTextVC.h"
#import "UIViewController+MJPopupViewController.h"


@interface FitEvolutionView_Additional : UIView
{
    FitEquation1* equation1;
    UIPopoverController *popoverController;
    CopiedTextVC *copiedTxtPopverVC;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;
@property (weak, nonatomic) IBOutlet UITextView *contentTV;

- (IBAction)btnUnderlineAction:(id)sender;
- (IBAction)btnHighlightAction:(id)sender;
- (void) applySelectedAttributesOnTextView;
- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;
- (IBAction)showhighlitedText:(id)sender;


@end
