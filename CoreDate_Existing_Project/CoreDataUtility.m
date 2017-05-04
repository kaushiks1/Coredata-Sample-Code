//
//  CoreDataUtility.m
//  CoreDate_Existing_Project
//
//  Created by SILICON on 01/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "CoreDataUtility.h"

@implementation CoreDataUtility

+ (void)insertData:(id)aData
{
    NSDictionary *dataDictionary = (NSDictionary *)aData;
    
    Form *aForm = (Form *)[NSEntityDescription insertNewObjectForEntityForName:@"Form" inManagedObjectContext:[[CoreDataManager sharedCoreDataManager]managedObjectContext]];
    
    aForm.firstName = ([dataDictionary objectForKey:@"firstName"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"firstName"]);
    aForm.lastName = ([dataDictionary objectForKey:@"lastName"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"lastName"]);
    aForm.phoneNumber = ([dataDictionary objectForKey:@"phoneNumber"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"phoneNumber"]);
    aForm.city = ([dataDictionary objectForKey:@"city"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"city"]);
    aForm.rollNo = ([dataDictionary objectForKey:@"rollNo"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"rollNo"]);
    
    
    NSError *error = nil;
    [[[CoreDataManager sharedCoreDataManager]managedObjectContext] save:&error];
    
}


+ (Form *)getStudentDetailRollNo:(NSString *)aRollNo
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Form" inManagedObjectContext:[[CoreDataManager sharedCoreDataManager]managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"rollNo == %@", aRollNo];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    
    NSArray *fetchResults = [[[CoreDataManager sharedCoreDataManager]managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    Form *aForm = [fetchResults lastObject];
    return aForm;
    
}


+ (void)updateData:(id)aData
{
    NSDictionary *dataDictionary = (NSDictionary *)aData;
    
    NSString *rollNo = ([dataDictionary objectForKey:@"rollNo"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"rollNo"]);
    Form *aForm = [self getStudentDetailRollNo:rollNo];
    
    if (aForm != nil)
    {
        aForm.firstName = ([dataDictionary objectForKey:@"firstName"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"firstName"]);
        aForm.lastName = ([dataDictionary objectForKey:@"lastName"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"lastName"]);
        aForm.phoneNumber = ([dataDictionary objectForKey:@"phoneNumber"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"phoneNumber"]);
        aForm.city = ([dataDictionary objectForKey:@"city"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"city"]);
        aForm.rollNo = ([dataDictionary objectForKey:@"rollNo"] == [NSNull null] ? @"NA":[dataDictionary objectForKey:@"rollNo"]);
        
        NSError *error = nil;
        [[[CoreDataManager sharedCoreDataManager]managedObjectContext] save:&error];
        
    }
    else
    {
        NSLog(@"Record Not Found");
    }
    
}

+ (void)deleteStudentDetailRollNo:(NSString *)aRollNo
{
    
    Form *aForm = [self getStudentDetailRollNo:aRollNo];
    
    if (aForm != nil)
    {
        [[[CoreDataManager sharedCoreDataManager]managedObjectContext] deleteObject:aForm];
    }
    NSError *error = nil;
    [[[CoreDataManager sharedCoreDataManager]managedObjectContext] save:&error];
}


+ (NSArray *)getAllRecords
{
    
    
    NSManagedObjectContext *context =[[CoreDataManager sharedCoreDataManager]managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Form"];
    
    NSError *error = nil;
    NSArray *arrayresults = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject *obj in arrayresults)
    {
        NSArray *keys = [[[obj entity] attributesByName] allKeys];
        NSArray *values = [[[obj entity] attributesByName] allValues];
        
        NSLog(@"%@",keys);
        NSLog(@"%@",values);
        
    }
    
    return arrayresults;
}

+ (void)deleteAllRecords;
{
    
    NSPersistentStore *store = [[[[CoreDataManager sharedCoreDataManager]persistentStoreCoordinator] persistentStores] lastObject];
    NSError *error = nil;
    NSURL *storeURL = store.URL;
    [[[CoreDataManager sharedCoreDataManager]persistentStoreCoordinator] removePersistentStore:store error:&error];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    
    //Make new persistent store for future saves   (Taken From Above Answer)
    if (![[[CoreDataManager sharedCoreDataManager]persistentStoreCoordinator] addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        // do something with the error
        NSLog(@"%@",error);
    }
    else
    {
        NSLog(@"Data Reset");
    }
    
}



@end
