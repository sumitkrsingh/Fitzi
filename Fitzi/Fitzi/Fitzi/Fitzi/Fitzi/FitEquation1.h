//
//  FitEquation1.h
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitEquationView.h"



@interface FitEquation1 : UIView{
     FitEquationView *equationView;
    
 
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;



//- (IBAction) swipeUpDone:(id) sender;






@end
