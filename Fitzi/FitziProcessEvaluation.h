//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziProcessEvaluation1.h"
#import "FitziProcessEvaluation_Additional.h"
#import "RichTextEditor.h"

@interface FitziProcessEvaluation : UIView <RichTextEditorDataSource>
{
    FitziProcessEvaluation1 *fitzProcessEval1;
    FitziProcessEvaluation_Additional* fitziProcessEvaluation_Additional;
   
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
