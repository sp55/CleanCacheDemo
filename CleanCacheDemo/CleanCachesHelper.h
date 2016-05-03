//
//  CleanCachesHelper.h
//  CleanCacheDemo
//
//  Created by admin on 16/5/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CleanCachesHelper : NSObject


//获取缓存路径
+ (NSString *)getCachesPath:(NSString *)fileName;
//计算单个文件大小的方法
+ (long long)fileSizeAtPath:(NSString *)path;
//计算一个文件夹大小
+ (float)folderSizeAtPath:(NSString *)path;
//清空缓存方法
+ (void)cleanCaches:(NSString *)path;


@end
