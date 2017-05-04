//
//  CoreDataUtility.h
//  CoreDate_Existing_Project
//
//  Created by SILICON on 01/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataManager.h"
#import "Form.h"

@interface CoreDataUtility : NSObject

+ (void)insertData:(id)aData;
+ (Form *)getStudentDetailRollNo:(NSString *)aRollNo;
+ (void)updateData:(id)aData;
+ (void)deleteStudentDetailRollNo:(NSString *)aRollNo;
+ (NSArray *)getAllRecords;
+ (void)deleteAllRecords;


@end
