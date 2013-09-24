//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitEvolutionView_Additional.h"
#import "CopiedTextVC.h"
#import "UIViewController+MJPopupViewController.h"

@interface FitEvolutionView : UIView 
{
    FitEvolutionView_Additional* fitEvolutionView_Additional;
    UIPopoverController *popoverController;
    CopiedTextVC *copiedTxtPopverVC;
    
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;
@property (weak, nonatomic) IBOutlet UITextView *contentTV;

- (IBAction)btnUnderlineAction:(id)sender;
- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;
- (IBAction)btnHighlightAction:(id)sender;
- (void) applySelectedAttributesOnTextView;
- (IBAction)showhighlitedText:(id)sender;

@end
