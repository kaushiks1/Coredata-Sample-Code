//
//  CoreDataHelper.m
//  CoreDate_Existing_Project
//
//  Created by SILICON on 29/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


+ (CoreDataManager *)sharedCoreDataManager
{
    static CoreDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataManager alloc]init];
    });
    return sharedInstance;
}


#pragma mark - Application's Documents directory
// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory{
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Apple.coreDataApple" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


/*
 
 // Returns the persistent store coordinator for the application.
 // If the coordinator doesn't already exist, it is created and the application's store added to it.
 - (NSPersistentStoreCoordinator *)persistentStoreCoordinator
 {
 // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
 if (_persistentStoreCoordinator != nil) {
 return _persistentStoreCoordinator;
 }
 
 NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataModel.sqlite"];
 
 NSError *error = nil;
 _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
 if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
 
 
 //         Replace this implementation with code to handle the error appropriately.
 //
 //         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
 //
 //         Typical reasons for an error here include:
 //         * The persistent store is not accessible;
 //         * The schema for the persistent store is incompatible with current managed object model.
 //         Check the error message to determine what the actual problem was.
 //
 //         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
 //
 //         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
 //         * Simply deleting the existing store:
 //         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
 //
 //         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
 //         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
 //
 //         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
 
 
 NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
 abort();
 }
 
 return _persistentStoreCoordinator;
 }
 */




- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataModel.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}



// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator)
    {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return _managedObjectContext;
}



#pragma mark - Core Data Saving support
- (void)saveContext{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}



@end
