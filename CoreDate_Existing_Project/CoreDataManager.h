//
//  CoreDataHelper.h
//  CoreDate_Existing_Project
//
//  Created by SILICON on 29/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataManager : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CoreDataManager *)sharedCoreDataManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory; // nice to have to reference files for core data



@end
