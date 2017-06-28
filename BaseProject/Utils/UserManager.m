//
//  UserManager.m
//  WaLanFlowerType
//
//  Created by 瓦栏 on 16/9/22.
//  Copyright © 2016年 瓦栏. All rights reserved.
//

#import "UserManager.h"

// 文件路径
#define kFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation UserManager

@synthesize user=_user;
single_implementation(UserManager)

- (id)init
{
    if (self = [super init]) {
        _user = [NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    }
    return self;
}

- (void)saveUser:(UserModel *)user
{
    _user = user;
    [NSKeyedArchiver archiveRootObject:user toFile:kFile];
}

- (void)removeUser
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:kFile]) {
        [[NSFileManager defaultManager]removeItemAtPath:kFile error:nil];
    }
}
-(UserModel *)user{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
}
@end
