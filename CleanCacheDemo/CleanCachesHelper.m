//
//  CleanCachesHelper.m
//  CleanCacheDemo
//
//  Created by admin on 16/5/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "CleanCachesHelper.h"

@implementation CleanCachesHelper


#pragma mark 获取缓存路径
+ (NSString *)getCachesPath:(NSString *)fileName
{
    //获取完整路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    NSString *cachesPath = [path stringByAppendingPathComponent:fileName];
    return cachesPath;
}

#pragma mark 计算单个文件大小的方法
+ (long long)fileSizeAtPath:(NSString *)path
{
    //创建一个文件管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    if ([manger fileExistsAtPath:path]) {
        return [[manger attributesOfItemAtPath:path error:nil] fileSize];
    }
    return 0;
}
#pragma mark 计算一个文件夹大小
+ (float)folderSizeAtPath:(NSString *)path
{
    //创建文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {
        return 0;
    }
    //根据路径获取文件夹里面的元素的集合
    //获取集合类型的枚举器
    NSEnumerator *enumerator = [[manager subpathsAtPath:path] objectEnumerator];
    //每次遍历得到的文件名
    NSString *fileName = [NSString string];
    //文件夹大小
    float folderSize = 0;
    while ((fileName = [enumerator nextObject]) != nil) {
        NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:absolutePath];
    }
    return folderSize / (1024.0 * 1024.0);
}

#pragma mark 清空缓存方法
+ (void)cleanCaches:(NSString *)path
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        NSArray *fileNameArray = [manager subpathsAtPath:path];
        for (NSString *fileName in fileNameArray) {
            //拼接绝对路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            //通过管理者删除文件
            [manager removeItemAtPath:absolutePath error:nil];
        }
    }
}


@end
