//
//  main.m
//  4.7.4
//
//  Created by 李维佳 on 2017/3/28.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager *fm = [NSFileManager defaultManager];
        
        //变更当前目录到桌面Desktop
        NSArray * paths = NSSearchPathForDirectoriesInDomains (NSDesktopDirectory, NSUserDomainMask, YES);
        NSString * desktopPath = [paths objectAtIndex:0];
        [fm changeCurrentDirectoryPath:desktopPath];
        
        //读取文件内容
        NSString *filePath = [desktopPath stringByAppendingPathComponent:@"myfile.txt"];
        NSData *fileData = [fm contentsAtPath:filePath];
        NSString *fileContent = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",fileContent);
        
        //把NSData写入文件
        //方法一
        NSString *newFilePath1 = [desktopPath stringByAppendingPathComponent:@"myNewFile1.txt"];
        if ([fileData writeToFile:newFilePath1 atomically:YES]) {
            NSLog(@"使用writeToFile:方法写入成功！");
        };
        
        //方法二
        NSString *newFilePath2 = [desktopPath stringByAppendingPathComponent:@"myNewFile2.txt"];
        if ([fm createFileAtPath:newFilePath2 contents:fileData attributes:nil]) {
            NSLog(@"使用createFileAtPath:方法写入成功！");
        };
    }
    return 0;
}
