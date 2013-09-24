//
//  SaveAttr.h
//  Fitzi
//
//  Created by MacBook on 14/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SaveAttr : NSManagedObject

@property (nonatomic, retain) NSString * attrkey;
@property (nonatomic, retain) NSString * attrVal;
@property (nonatomic, retain) NSString * tagid;
@property (nonatomic, retain) NSString * textString;
@property (nonatomic, retain) NSString * textVal;
@property (nonatomic, retain) NSString * timestamp;

@end
