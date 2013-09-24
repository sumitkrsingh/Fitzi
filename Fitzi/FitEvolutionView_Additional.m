//
//  FitEvolutionView_Additional.m
//  Fitzi
//
//  Created by MacBook on 10/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitEvolutionView_Additional.h"
#import "FitEvolutionView.h"



@implementation FitEvolutionView_Additional

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
        [self performSelector:@selector(applySelectedAttributesOnTextView) withObject:nil afterDelay:1.0];
    }
    return self;
}

- (IBAction) swipeUpDone:(id) sender
{
     //NSLog(@"xjksjxjs");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEvolutionView"
                                                    owner:self options:nil];
    FitEvolutionView *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvolutionView class]])
            indexView = (FitEvolutionView *)object;
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
    
    //NSLog(@"Swipe Up Done_evolution");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquation1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquation1 class]])
            equation1 = (FitEquation1 *) object;
    }
    [self addSubview:equation1];
    equation1.frame = CGRectMake(0.0, self.bounds.size.height, equation1.bounds.size.width, equation1.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         equation1.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}


- (IBAction)btnHighlightAction:(id)sender
{
    NSLog(@"btnHighlightAction Clicked..");
    NSUInteger selectedlength = [self.contentTV offsetFromPosition:self.contentTV.selectedTextRange.start
                                                        toPosition:self.contentTV.selectedTextRange.end];
    if ([self.contentTV isFirstResponder] || (selectedlength > 0))
    {
        NSRange range = self.contentTV.selectedRange;
        NSMutableAttributedString *attributedString = [self.contentTV.attributedText mutableCopy];
        id attributeKey = @"NSBackgroundColor";
        id attribute = [UIColor grayColor];
        
        if (range.length == attributedString.length-1 && range.length == self.contentTV.text.length)
            ++range.length;
        
        [attributedString addAttributes:[NSDictionary dictionaryWithObject:attribute forKey:attributeKey] range:range];
        
        [self.contentTV setAttributedText:attributedString];
        [self.contentTV setSelectedRange:range];
        
        NSMutableDictionary *dictTowrite = [[NSMutableDictionary alloc] init];
        [dictTowrite setValue:@"NSBackgroundColor" forKey:@"attrkey"];
        [dictTowrite setValue:[FitziCommon getNSStringFromUIColor:[UIColor grayColor]] forKey:@"attrVal"];
        [dictTowrite setValue:[NSString stringWithFormat:@"%d",self.tag] forKey:@"tagid"];
        [dictTowrite setObject:[NSString stringWithFormat:@"%@",[NSValue valueWithRange:self.contentTV.selectedRange]] forKey:@"textVal"];
        NSString *selectedText = [self.contentTV textInRange:[self.contentTV selectedTextRange]];
        [dictTowrite setObject:selectedText forKey:@"textString"];
        [dictTowrite setObject:[NSString stringWithFormat:@"%@",[NSDate date]] forKey:@"timestamp"];
        
        [FitziCommon insertCustomer:dictTowrite];
    }
    else
    {
        NSLog(@"Please Select text...");
        UIAlertView *alertSelectText = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please select the text first..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertSelectText show];
    }
}

- (IBAction)btnUnderlineAction:(id)sender
{
    NSLog(@"btnHighlightAction Clicked..");
    NSUInteger selectedlength = [self.contentTV offsetFromPosition:self.contentTV.selectedTextRange.start
                                                        toPosition:self.contentTV.selectedTextRange.end];
    if ([self.contentTV isFirstResponder] || (selectedlength > 0))
    {
        NSDictionary *dictionary = [FitziCommon dictionaryAtIndex:self.contentTV.selectedRange.location andTextView:self.contentTV];
        NSNumber *existingUnderlineStyle = [dictionary objectForKey:NSUnderlineStyleAttributeName];
        
        if (!existingUnderlineStyle || existingUnderlineStyle.intValue == NSUnderlineStyleNone)
            existingUnderlineStyle = [NSNumber numberWithInteger:NSUnderlineStyleSingle];
        else
            existingUnderlineStyle = [NSNumber numberWithInteger:NSUnderlineStyleNone];
        
        NSRange range = self.contentTV.selectedRange;
        NSMutableAttributedString *attributedString = [self.contentTV.attributedText mutableCopy];
        id attributeKey = @"NSUnderline";
        id attribute = existingUnderlineStyle;
        
        if (range.length == attributedString.length-1 && range.length == self.contentTV.text.length)
            ++range.length;
        
        [attributedString addAttributes:[NSDictionary dictionaryWithObject:attribute forKey:attributeKey] range:range];
        
        [self.contentTV setAttributedText:attributedString];
        [self.contentTV setSelectedRange:range];
        
        NSMutableDictionary *dictTowrite = [[NSMutableDictionary alloc] init];
        [dictTowrite setValue:@"NSUnderline" forKey:@"attrkey"];
        [dictTowrite setValue:[NSString stringWithFormat:@"%@",existingUnderlineStyle] forKey:@"attrVal"];
        [dictTowrite setValue:[NSString stringWithFormat:@"%d",self.tag] forKey:@"tagid"];
        [dictTowrite setObject:[NSString stringWithFormat:@"%@",[NSValue valueWithRange:self.contentTV.selectedRange]] forKey:@"textVal"];
        NSString *selectedText = [self.contentTV textInRange:[self.contentTV selectedTextRange]];
        [dictTowrite setObject:selectedText forKey:@"textString"];
        [dictTowrite setObject:[NSString stringWithFormat:@"%@",[NSDate date]] forKey:@"timestamp"];
        
        [FitziCommon insertCustomer:dictTowrite];
    }
    else
    {
        NSLog(@"Please Select text...");
        UIAlertView *alertSelectText = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please select the text first..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertSelectText show];
    }
}

- (void) applySelectedAttributesOnTextView
{
    NSArray *dataInPlist = [FitziCommon getCustomerList];
    
    for (int i = 0; i < [dataInPlist count]; i++)
    {
        NSDictionary *rowDict = [dataInPlist objectAtIndex:i];
        NSString *selectedString = [rowDict valueForKey:@"textString"];
        if (!([self.contentTV.text rangeOfString:selectedString].location == NSNotFound))
        {
            id attributeVal = [rowDict valueForKey:@"attrVal"];
            NSString *attributeKey = [rowDict valueForKey:@"attrkey"];
            if ([attributeKey isEqualToString:@"NSBackgroundColor"])
            {
                attributeVal = [FitziCommon getUIColorFromNSString:[rowDict valueForKey:@"attrVal"]];
            }
            if ([attributeKey isEqualToString:@"NSUnderline"])
            {
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                attributeVal = [formatter numberFromString:[rowDict valueForKey:@"attrVal"]];
            }
            
            NSRange textRange = [self.contentTV.text rangeOfString:selectedString];
            [FitziCommon applyAttributes:attributeVal forKey:attributeKey atRange:textRange forTextView:self.contentTV];
        }
    }
    
}

- (IBAction)showhighlitedText:(id)sender
{
    copiedTxtPopverVC = [[CopiedTextVC alloc] initWithNibName:@"CopiedTextVC" bundle:[NSBundle mainBundle]];
    copiedTxtPopverVC.screenTag = 0;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:copiedTxtPopverVC];
    popoverController.popoverContentSize = CGSizeMake(700.0, 500.0);
    [[self viewController] presentPopupViewController:copiedTxtPopverVC animationType:0];
}

- (UIViewController *) viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    
    return nil;
}

@end
