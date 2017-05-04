//
//  Utility.m
//  AutoLAyout_ScrollView_SignUp
//
//  Created by Apple on 21/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "Utility.h"
#import <objc/message.h>

@implementation Utility

+ (NSString *)descriptionForObject:(id)objct
{
    unsigned int varCount;
    NSMutableString *descriptionString = [[NSMutableString alloc]init];
    
    objc_property_t *vars = class_copyPropertyList(object_getClass(objct), &varCount);
    
    for (int i = 0; i < varCount; i++)
    {
        objc_property_t var = vars[i];
        
        const char* name = property_getName (var);
        
        NSString *keyValueString = [NSString stringWithFormat:@"\n%@ = %@",[NSString stringWithUTF8String:name],[objct valueForKey:[NSString stringWithUTF8String:name]]];
        [descriptionString appendString:keyValueString];
    }
    
    free(vars);
    return descriptionString;
}

@end
