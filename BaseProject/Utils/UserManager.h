//
//  UserManager.h
//  WaLanFlowerType
//
//  Created by 瓦栏 on 16/9/22.
//  Copyright © 2016年 瓦栏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserManager : NSObject

single_interface(UserManager)

- (void)saveUser:(UserModel *)user;
- (void)removeUser;

// 获得当前账号
@property (nonatomic, readonly) UserModel *user;

@end
