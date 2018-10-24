//
//  ViewController.m
//  ValidateTextFieldDemo
//
//  Created by CumminsTY on 2018/10/24.
//  Copyright © 2018 --. All rights reserved.
//

#import "ViewController.h"
#import "ValidateTextField.h"
#import "ValidateRule.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"tf封装";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    NSArray * rules = @[PhoneRule,NickRule];
    NSArray * errors = @[@"手机号输入错误",@"昵称输入格式错误"];
    NSArray * emptys = @[@"手机号不能为空",@"昵称不能为空"];
    for ( int i = 0; i<2; i++) {
        ValidateTextField * tf = [[ValidateTextField alloc]init];
        tf.errorMsg = errors[i];
        tf.emptyMsg = emptys[i];
        tf.validateRule = rules[i];
        tf.placeholder = @"请输入内容";
        tf.frame = CGRectMake(100, 100+i*50, 100, 40);
        tf.textColor = [UIColor redColor];
        tf.font = [UIFont systemFontOfSize:15];
        tf.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:tf];
        
    }
    
    UIButton * validateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    validateBtn.frame = CGRectMake(50, 300, 100, 50);
    [validateBtn setTitle:@"验证" forState:UIControlStateNormal];
    validateBtn.backgroundColor = [UIColor greenColor];
    [validateBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [validateBtn addTarget:self action:@selector(valudate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:validateBtn];
    
    
}
-(void)valudate:(UIButton*)sender{
    ValidateRule * rule = [[ValidateRule alloc]initWithController:self];
    NSDictionary * dic = [rule validateResultWithView:self.view];
    BOOL isRight = dic[@"result"];
    NSString * msg = dic[@"message"];
    NSLog(@"isright = %d     msg = %@",isRight,msg);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
