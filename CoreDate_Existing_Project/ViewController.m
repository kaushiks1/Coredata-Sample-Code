//
//  ViewController.m
//  CoreDate_Existing_Project
//
//  Created by SILICON on 29/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonActionInsertData:(id)sender {
    
    {
    NSMutableDictionary *dictionaryStudentDetail = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                    @"Philippe", @"firstName",
                                                    @"Wilson", @"lastName",
                                                    @"1212121212", @"phoneNumber",
                                                    @"California", @"city",
                                                    @"11", @"rollNo", nil];
    
    [CoreDataUtility insertData:dictionaryStudentDetail];
    }
    {
        NSMutableDictionary *dictionaryStudentDetail = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                        @"Ales", @"firstName",
                                                        @"Wilson", @"lastName",
                                                        @"1717171717", @"phoneNumber",
                                                        @"USA", @"city",
                                                        @"12", @"rollNo", nil];
        
        [CoreDataUtility insertData:dictionaryStudentDetail];
    }
    {
        NSMutableDictionary *dictionaryStudentDetail = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                        @"Steave", @"firstName",
                                                        @"Reonaldo", @"lastName",
                                                        @"123456790", @"phoneNumber",
                                                        @"California", @"city",
                                                        @"13", @"rollNo", nil];
        
        [CoreDataUtility insertData:dictionaryStudentDetail];
    }
    
}

- (IBAction)buttonActionFetchData:(id)sender {
    
    {
   Form *aForm = [CoreDataUtility getStudentDetailRollNo:@"11"];
    
        if (aForm != nil) {
            NSLog(@"%@",aForm.firstName);
            NSLog(@"%@",aForm.lastName);
            NSLog(@"%@",aForm.phoneNumber);
            NSLog(@"%@",aForm.city);
            NSLog(@"%@",aForm.rollNo);
        }
    }
    
    {
        Form *aForm = [CoreDataUtility getStudentDetailRollNo:@"12"];
        
        if (aForm != nil) {
            NSLog(@"%@",aForm.firstName);
            NSLog(@"%@",aForm.lastName);
            NSLog(@"%@",aForm.phoneNumber);
            NSLog(@"%@",aForm.city);
            NSLog(@"%@",aForm.rollNo);
        }
        
        
    }
    {
        Form *aForm = [CoreDataUtility getStudentDetailRollNo:@"13"];
        
        if (aForm != nil) {
            NSLog(@"%@",aForm.firstName);
            NSLog(@"%@",aForm.lastName);
            NSLog(@"%@",aForm.phoneNumber);
            NSLog(@"%@",aForm.city);
            NSLog(@"%@",aForm.rollNo);
        }
    }
}

- (IBAction)buttonActionUpdataData:(id)sender {
    
    
    NSMutableDictionary *dictionaryStudentUpdateDetail = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                          @"NewSteave", @"firstName",
                                                          @"NewReonaldo", @"lastName",
                                                          @"+91123456790", @"phoneNumber",
                                                          @"New York", @"city",
                                                          @"13", @"rollNo", nil];
    
    
    
    
    [CoreDataUtility updateData:dictionaryStudentUpdateDetail];
}

- (IBAction)buttonActionDeleteData:(id)sender {
    
    [CoreDataUtility deleteStudentDetailRollNo:@"12"];
}

- (IBAction)buttonActionViewAllData:(id)sender {
    
    NSArray *arrayAllData = [[NSArray alloc]initWithArray:[CoreDataUtility getAllRecords]];
    NSLog(@"%@",arrayAllData);
    
    if (arrayAllData.count > 0)
    {
        for (int i = 0; i<[arrayAllData count]; i++)
        {
           NSLog(@"%@",[[arrayAllData objectAtIndex:i]valueForKey:@"firstName"]);
        }
        
    }

}

- (IBAction)buttonActionDeleteAllData:(id)sender {
    
    [CoreDataUtility deleteAllRecords];
}




@end
