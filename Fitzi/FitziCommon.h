//
//  FitziCommon.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 12/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SaveAttr.h"
#import "AppDelegate.h"

@interface FitziCommon : NSObject

+ (void) insertCustomer:(NSDictionary *) data;
+ (NSArray *) getCustomerList;
+ (NSArray *) getHighlightedData;
+ (NSArray *) getUnderlinedData;
+ (NSArray *) getMyNotesData;
+ (void) insertNotes:(NSDictionary *) data;
+ (void) deleteDBDataForEntityName:(NSString *) entityName;
+ (NSString *) getNSStringFromUIColor:(UIColor *) inputColor;
+ (UIColor *) getUIColorFromNSString:(NSString *) inputString;
+ (void)applyAttributes:(id)attribute forKey:(NSString *)key atRange:(NSRange)range forTextView:(UITextView *) textView;
+ (NSDictionary *)dictionaryAtIndex:(NSInteger)index andTextView:(UITextView *) myTextView;
+ (NSArray *) displayContent;

@end
