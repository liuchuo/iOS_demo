//
//  ViewController.m
//  iMoney
//
//  Created by ChenXin on 16/9/28.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *zhifubao;
@property (weak, nonatomic) IBOutlet UITextField *xianjin;
@property (weak, nonatomic) IBOutlet UITextField *cardA;
@property (weak, nonatomic) IBOutlet UITextField *cardB;
@property (weak, nonatomic) IBOutlet UITextField *huabei;
@property (weak, nonatomic) IBOutlet UITextField *creatCard;
@property (weak, nonatomic) IBOutlet UITextField *fenqi;
@property (weak, nonatomic) IBOutlet UITextField *diandizhenxi;

@end

@implementation ViewController
- (IBAction)saveButton:(id)sender {
    NSUserDefaults *zhifubaovalue = [NSUserDefaults standardUserDefaults];
    zhifubaovalue.setFloat(zhifubao.text, forKey:"zhifubaodata");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
