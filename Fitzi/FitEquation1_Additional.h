//
//  FitEquation1_Additional.h
//  Fitzi
//
//  Created by MacBook on 11/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitEquationView.h"
#import "RichTextEditor.h"

@interface FitEquation1_Additional : UIView <RichTextEditorDataSource>
{
    FitEquationView* fitEquationView;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

//-(IBAction)swipeUpDone:(id)sender;

@end
