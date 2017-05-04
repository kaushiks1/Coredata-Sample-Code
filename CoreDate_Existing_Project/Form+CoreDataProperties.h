//
//  Form+CoreDataProperties.h
//  CoreDate_Existing_Project
//
//  Created by SILICON on 01/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Form.h"

NS_ASSUME_NONNULL_BEGIN

@interface Form (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *rollNo;

@end

NS_ASSUME_NONNULL_END
