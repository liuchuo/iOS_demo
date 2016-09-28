//
//  AppDelegate.h
//  iMoney
//
//  Created by ChenXin on 16/9/28.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

