//
//  LightStorageManager.m
//  RAC空项目
//
//  Created by chenkaijie on 17/4/7.
//  Copyright © 2017年 chenkaijie. All rights reserved.
//

#import "LightStorageManager.h"


#define  UserDefaults [NSUserDefaults standardUserDefaults]

@implementation LightStorageManager


/*
 #define KJ(String) ([NSString stringWithFormat:@"KJ%@", String])
 
 + (BOOL)saveObjc:(id)objc key:(NSString *)objcKey {
 
 NSArray <NSString *> *classArr = @[@"NSString", @"NSArray", @"NSDictionary"];
 
 for (NSString *item in classArr) {
 if ([objc isKindOfClass:NSClassFromString(item)] == NO) {
 return NO;
 }
 }
 
 
 NSArray *arr1 = [[NSArray alloc]initWithObjects:@"0",@"5",nil];
 
 NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr1];
 
 NSArray *arr2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
 
 
 NSLog(@"+>%@",[arr1 objectAtIndex:1]);
 NSLog(@"+>%@",[arr2 objectAtIndex:1]);
 
 
 NSData *data = nil;
 BOOL result = NO;
 
 if ([objc isKindOfClass:[NSString class]]) {
 NSString *tempObjc = (NSString *)objc;
 data = [tempObjc dataUsingEncoding:NSUTF8StringEncoding];
 } else if ([objc isKindOfClass:[NSArray class]]) {
 NSArray *tempObjc = (NSArray *)objc;
 data = [NSJSONSerialization dataWithJSONObject:tempObjc options:NSJSONWritingPrettyPrinted error:nil];
 } else if ([objc isKindOfClass:[NSDictionary class]]) {
 NSDictionary *tempObjc = (NSDictionary *)objc;
 }
 result = [FileManagerTool writeData:data toExistFile:KJ(objcKey)];
 return result;
 }
 + (id)readObjcOfKey:(NSString *)objcKey {
 
 if (objcKey == nil || [objcKey isKindOfClass:[NSNull class]]) {
 return nil;
 }
 NSData *data = [FileManagerTool readDataAtPath:<#(NSString *)#>];
 
 if ([objc isKindOfClass:[NSString class]]) {
 NSString *tempObjc = (NSString *)objc;
 data = [tempObjc dataUsingEncoding:NSUTF8StringEncoding];
 } else if ([objc isKindOfClass:[NSArray class]]) {
 NSArray *tempObjc = (NSArray *)objc;
 data = [NSJSONSerialization dataWithJSONObject:tempObjc options:NSJSONWritingPrettyPrinted error:nil];
 } else if ([objc isKindOfClass:[NSDictionary class]]) {
 NSDictionary *tempObjc = (NSDictionary *)objc;
 
 }
 }
 
 + (BOOL)deleteObjcOfKey:(NSString *)objcKey {
 return nil;
 }
 
 */


/*
 支持的数据类型有NSNumber（NSInteger、float、double），NSString，NSDate，NSArray，NSDictionary，BOOL.
 */

#pragma mark - 读取
+ (nullable id)objectForKey:(NSString *_Nonnull)defaultName defaultValue:(nullable id)defaultValue {
    id objc = [UserDefaults objectForKey:defaultName];
    if (objc == nil) {
        if (defaultValue != nil) {
            [UserDefaults setObject:defaultValue forKey:defaultName];
        }
    }
    return [UserDefaults objectForKey:defaultName];
}
+ (void)removeObjectForKey:(NSString *)defaultName {
    [UserDefaults removeObjectForKey:defaultName];
    [UserDefaults synchronize];
}
+ (nullable NSString *)stringForKey:(NSString *)defaultName {
    return [UserDefaults stringForKey:defaultName];
}
+ (nullable NSArray *)arrayForKey:(NSString *)defaultName {
    return [UserDefaults arrayForKey:defaultName];
}
+ (nullable NSDictionary<NSString *, id> *)dictionaryForKey:(NSString *)defaultName {
    return [UserDefaults dictionaryForKey:defaultName];
}
+ (nullable NSData *)dataForKey:(NSString *)defaultName {
    return [UserDefaults dataForKey:defaultName];
}
+ (nullable NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName {
    return [UserDefaults stringArrayForKey:defaultName];
}
+ (NSInteger)integerForKey:(NSString *)defaultName {
    return [UserDefaults integerForKey:defaultName];
}
+ (float)floatForKey:(NSString *)defaultName {
    return [UserDefaults floatForKey:defaultName];
}
+ (double)doubleForKey:(NSString *)defaultName {
    return [UserDefaults doubleForKey:defaultName];
}
+ (BOOL)boolForKey:(NSString *)defaultName {
    return [UserDefaults boolForKey:defaultName];
}
+ (nullable NSURL *)URLForKey:(NSString *)defaultName {
    return [UserDefaults URLForKey:defaultName];
}


#pragma mark - 设置
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName {
    [UserDefaults setObject:value forKey:defaultName];
    [UserDefaults synchronize];
}
+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName {
    [UserDefaults setInteger:value forKey:defaultName];
    [UserDefaults synchronize];
}
+ (void)setFloat:(float)value forKey:(NSString *)defaultName {
    [UserDefaults setFloat:value forKey:defaultName];
    [UserDefaults synchronize];
}
+ (void)setDouble:(double)value forKey:(NSString *)defaultName {
    [UserDefaults setDouble:value forKey:defaultName];
    [UserDefaults synchronize];
}
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName {
    [UserDefaults setBool:value forKey:defaultName];
    [UserDefaults synchronize];
}
+ (void)setURL:(nullable NSURL *)url forKey:(NSString *)defaultName {
    [UserDefaults setURL:url forKey:defaultName];
    [UserDefaults synchronize];
}





+ (void)kj1_setKeyOfZheDic:(NSString *)KeyOfZheDic want_setValue:(id)value want_setKey:(NSString *)key defaultValue:(id)defaultValue {
    if (key == nil) {
        NSLog(@"------警告----- want_setKey为空 ------");
        return;
    }
    
    NSDictionary *dic = [LightStorageManager dictionaryForKey:KeyOfZheDic];
    if (dic == nil || [dic.allKeys containsObject:key] == NO) {
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        [tempDic setValue:defaultValue forKey:key];
        [LightStorageManager setObject:tempDic forKey:KeyOfZheDic];
        dic = tempDic;
    }
    NSMutableDictionary *okDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [okDic setValue:value forKey:key];
    
    [LightStorageManager setObject:okDic forKey:KeyOfZheDic];
}


+ (nullable id)kj1_KeyOfZheDic:(NSString *)KeyOfZheDic want_getZhekey:(NSString *)key defaultValue:(id)defaultValue {
    NSDictionary *dic = [LightStorageManager dictionaryForKey:KeyOfZheDic];
    if (dic == nil || [dic.allKeys containsObject:key] == NO) {
        [self kj1_setKeyOfZheDic:KeyOfZheDic want_setValue:defaultValue want_setKey:key defaultValue:defaultValue];
    }
    
    return [[LightStorageManager dictionaryForKey:KeyOfZheDic] valueForKey:key];
}



@end
