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

#pragma mark - add20160823


// 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path;
// 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath;
// 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path;
// 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;
@end
