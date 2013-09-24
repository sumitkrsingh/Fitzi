//
//  FitziCommon.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 12/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziCommon.h"
#import "MyNotes.h"

@implementation FitziCommon

+ (void) insertCustomer:(NSDictionary *) data
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    SaveAttr *customerData          =   (SaveAttr *)[NSEntityDescription insertNewObjectForEntityForName:@"SaveAttr" inManagedObjectContext:appDelegate.managedObjectContext];
        
    [customerData setAttrkey:[data valueForKey:@"attrkey"]];
    [customerData setAttrVal:[data valueForKey:@"attrVal"]];
    [customerData setTextString:[data valueForKey:@"textString"]];
    [customerData setTagid:[data valueForKey:@"tagid"]];
    [customerData setTextVal:[data valueForKey:@"textVal"]];
     [customerData setTimestamp:[data valueForKey:@"timestamp"]];
    
        
    NSError *error;
    if(![appDelegate.managedObjectContext save:&error])
    {
        NSLog(@"Save Unsuccessful");
    }
}

+ (NSArray *) getCustomerList
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSFetchRequest *fetchRequest        =   [[NSFetchRequest alloc] init];
    NSEntityDescription *entity         =   [NSEntityDescription entityForName:@"SaveAttr" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSMutableArray *returnData = [[NSMutableArray alloc] init];
    NSArray *fetchedObjects             =   [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (int i = 0; i < [fetchedObjects count]; i++) 
    {
        NSMutableDictionary *rowDict = [[NSMutableDictionary alloc] init];
        SaveAttr *attrVal = [fetchedObjects objectAtIndex:i];
        [rowDict setObject:attrVal.attrkey forKey:@"attrkey"];
        [rowDict setObject:attrVal.attrVal forKey:@"attrVal"];
        [rowDict setObject:attrVal.textVal forKey:@"textVal"];
        [rowDict setObject:attrVal.tagid forKey:@"tagid"];
         [rowDict setObject:attrVal.textString forKey:@"textString"];
         [rowDict setObject:attrVal.timestamp forKey:@"timestamp"];
        [returnData addObject:rowDict];
        rowDict = nil;
    }
    
    return returnData;
}

+ (NSArray *) getHighlightedData
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest        =   [[NSFetchRequest alloc] init];
    NSEntityDescription *entity         =   [NSEntityDescription entityForName:@"SaveAttr" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"attrkey = %@",@"NSBackgroundColor"];
    [fetchRequest setPredicate:predicate];
    
    NSError *error;
    NSMutableArray *returnData = [[NSMutableArray alloc] init];
    NSArray *fetchedObjects             =   [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (int i = 0; i < [fetchedObjects count]; i++)
    {
        NSMutableDictionary *rowDict = [[NSMutableDictionary alloc] init];
        SaveAttr *attrVal = [fetchedObjects objectAtIndex:i];
        [rowDict setObject:attrVal.textString forKey:@"textString"];
        [rowDict setObject:attrVal.timestamp forKey:@"timestamp"];
        [returnData addObject:rowDict];
        rowDict = nil;
    }
    return returnData;
}

+ (NSArray *) getUnderlinedData
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest        =   [[NSFetchRequest alloc] init];
    NSEntityDescription *entity         =   [NSEntityDescription entityForName:@"SaveAttr" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"attrkey = %@",@"NSUnderline"];
    [fetchRequest setPredicate:predicate];
    
    NSError *error;
    NSMutableArray *returnData = [[NSMutableArray alloc] init];
    NSArray *fetchedObjects             =   [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (int i = 0; i < [fetchedObjects count]; i++)
    {
        NSMutableDictionary *rowDict = [[NSMutableDictionary alloc] init];
        SaveAttr *attrVal = [fetchedObjects objectAtIndex:i];
        [rowDict setObject:attrVal.textString forKey:@"textString"];
        [rowDict setObject:attrVal.timestamp forKey:@"timestamp"];
        [returnData addObject:rowDict];
        rowDict = nil;
    }
    return returnData;
}

+ (NSArray *) getMyNotesData
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest        =   [[NSFetchRequest alloc] init];
    NSEntityDescription *entity         =   [NSEntityDescription entityForName:@"MyNotes" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
     
    NSError *error;
    NSMutableArray *returnData = [[NSMutableArray alloc] init];
    NSArray *fetchedObjects             =   [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (int i = 0; i < [fetchedObjects count]; i++)
    {
        NSMutableDictionary *rowDict = [[NSMutableDictionary alloc] init];
        MyNotes *attrVal = [fetchedObjects objectAtIndex:i];
        [rowDict setObject:attrVal.note forKey:@"textString"];
        [rowDict setObject:attrVal.timestamp forKey:@"timestamp"];
        [returnData addObject:rowDict];
        rowDict = nil;
    }
    return returnData;
}

+ (void) insertNotes:(NSDictionary *) data
{
    [FitziCommon deleteDBDataForEntityName:@"MyNotes"];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MyNotes *customerData          =   (MyNotes *)[NSEntityDescription insertNewObjectForEntityForName:@"MyNotes" inManagedObjectContext:appDelegate.managedObjectContext];
    
    [customerData setNote:[data valueForKey:@"textVal"]];
    [customerData setTimestamp:[data valueForKey:@"timestamp"]];
    
    
    NSError *error;
    if(![appDelegate.managedObjectContext save:&error])
    {
        NSLog(@"Save Unsuccessful");
    }
}

+ (void) deleteDBDataForEntityName:(NSString *) entityName
{    
    NSError *error;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:appDelegate.managedObjectContext]];
    [fetchRequest setIncludesPropertyValues:NO];
    
    NSArray *specificDateArr = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject * fetchedDate in specificDateArr) {
        [appDelegate.managedObjectContext deleteObject:fetchedDate];
    }
    
    if (![appDelegate.managedObjectContext save:&error])
        NSLog(@"Error: %@", [error description]);
    
}

+ (NSString *) getNSStringFromUIColor:(UIColor *) inputColor
{
    // UIColor to NSString
    CGColorRef colorRef = inputColor.CGColor;
    NSString *colorString = [CIColor colorWithCGColor:colorRef].stringRepresentation;
    
    return colorString;
}

+ (UIColor *) getUIColorFromNSString:(NSString *) inputString
{
    // NSString to UIColor
    NSArray *components = [inputString componentsSeparatedByString:@" "];
    CGFloat r = [[components objectAtIndex:0] floatValue];
    CGFloat g = [[components objectAtIndex:1] floatValue];
    CGFloat b = [[components objectAtIndex:2] floatValue];
    CGFloat a = [[components objectAtIndex:3] floatValue];
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:a];
    return color;
}

+ (void)applyAttributes:(id)attribute forKey:(NSString *)key atRange:(NSRange)range forTextView:(UITextView *) textView
{
	// If any text selected apply attributes to text
	if (range.length > 0)
	{
		NSMutableAttributedString *attributedString = [textView.attributedText mutableCopy];
		
        // Workaround for when there is only one paragraph,
		// sometimes the attributedString is actually longer by one then the displayed text,
		// and this results in not being able to set to lef align anymore.
        if (range.length == attributedString.length-1 && range.length == textView.text.length)
            ++range.length;
        
		[attributedString addAttributes:[NSDictionary dictionaryWithObject:attribute forKey:key] range:range];
		
		[textView setAttributedText:attributedString];
		[textView setSelectedRange:range];
	}
	// If no text is selected apply attributes to typingAttribute
}

+ (NSDictionary *)dictionaryAtIndex:(NSInteger)index andTextView:(UITextView *) myTextView
{
	// If index at end of string, get attributes starting from previous character
	if (index == myTextView.attributedText.string.length && [myTextView hasText])
        --index;
	
    // If no text exists get font from typing attributes
    return  ([myTextView hasText])
    ? [myTextView.attributedText attributesAtIndex:index effectiveRange:nil]
    : myTextView.typingAttributes;
}

+ (NSArray *) displayContent
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"ScreenTextList" ofType:@"plist"];  
    NSArray *content = [[NSArray alloc] initWithContentsOfFile:filepath];
                        
    return content;
    
}


@end
