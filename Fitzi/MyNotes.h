//
//  MyNotes.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 18/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MyNotes : NSManagedObject

@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSString * timestamp;

@end
