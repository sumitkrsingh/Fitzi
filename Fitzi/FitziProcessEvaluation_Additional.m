//
//  FitziProcessEvaluation_Additional.m
//  Fitzi
//
//  Created by MacBook on 11/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#define POP_TEXT1  @"First impressions are virtually irreversible! If you stand at the back of the store, behind the counter or are viewed to be only interested in the iPad Mini you are holding you will look like a predator approaching its pray when you walk towards your customer to greet them...or worse yet you will look disinterested. With the extended runway at the front of the store it is essential that you are positioned in areas that allow you to see customers entering the store."

#define POP_TEXT2  @"Because Fitzi looks different you may find that customers will stand out the front of the store to see what it is about. This is another reason why floor positioning is essential to ensure that you can greet these customers in a relaxed, non confronting way. Too many sales are lost due to customers, walking out of the store without being greeted as they don’t feel like a priority. It’s essential that the sales floor is scanned every 20 seconds whether serving, doing daily jobs or training "

#define POP_TEXT3  @"Non product related questions are still essential but you may find that you will need to adapt your greeting to include Fitzi if they are standing there watching customers walking across Fitzi, looking at the screen saver, or inquisitive about the tablet you are holding. In these situations capitalise on these opportunities and explain the evolution in our fitting process and how Fitzi influences that, and then follow this up by introducing our Fitting Service."

#import "FitziProcessEvaluation_Additional.h"
#import "FitziProcessEvaluation.h"

@implementation FitziProcessEvaluation_Additional

- (id) initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        // Initialization code
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:@"• Floor positioning"];
        [attributeString addAttribute:NSUnderlineStyleAttributeName
                                value:[NSNumber numberWithInt:1]
                                range:(NSRange){0,[attributeString length]}];
        
        NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @1};
        
        self.lblPopup1.attributedText = [[NSAttributedString alloc] initWithString:@"• Floor positioning"
                                                                 attributes:underlineAttribute];
        self.lblPopup2.attributedText = [[NSAttributedString alloc] initWithString:@"• Floor awareness"
                                                                   attributes:underlineAttribute];
        self.lblPopup3.attributedText = [[NSAttributedString alloc] initWithString:@"• Non product greeting"
                                                                   attributes:underlineAttribute];
    }
    
    return self;
    
}


- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"fit process eva_add right");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation"
                                                    owner:self options:nil];
    FitziProcessEvaluation *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation class]])
            indexView = (FitziProcessEvaluation *)object;
    }
    [self addSubview:indexView];
    indexView.frame = CGRectMake(0.0, self.bounds.size.height, indexView.bounds.size.width, indexView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:NO ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         indexView.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}
- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"fit process eva_add left");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation1 class]])
            fitziProcessEvaluation1 = (FitziProcessEvaluation1 *)object;
    }
    [self addSubview:fitziProcessEvaluation1];
    fitziProcessEvaluation1.frame = CGRectMake(0.0, self.bounds.size.height, fitziProcessEvaluation1.bounds.size.width, fitziProcessEvaluation1.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitziProcessEvaluation1.frame = self.frame;
                     }];//

}

- (IBAction)showPopUpWithText:(id)sender
{
    [self preparePopupArray];
    PopupView *popupview = [[[NSBundle mainBundle] loadNibNamed:@"PopupView" owner:self options:nil] objectAtIndex:0];
    
    [popupview setPopupString:[popupText objectAtIndex:[sender tag]] andTitle:[popupTitle objectAtIndex:[sender tag]]];
    popupview.frame = CGRectMake(self.bounds.size.width/2 - popupview.bounds.size.width/2, self.bounds.size.height/2 - popupview.bounds.size.height/2, popupview.bounds.size.width, popupview.bounds.size.height);
    [self addSubview:popupview];
}

- (void) preparePopupArray
{
    popupText = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@",POP_TEXT1],[NSString stringWithFormat:@"%@",POP_TEXT2],[NSString stringWithFormat:@"%@",POP_TEXT3], nil];
    popupTitle = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@",@"Floor positioning"],[NSString stringWithFormat:@"%@",@"Floor awareness"],[NSString stringWithFormat:@"%@",@"Non product greeting"], nil];
}

- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor
{
	return RichTextEditorFeatureFontSize | RichTextEditorFeatureFont | RichTextEditorFeatureAll;
}


@end
