//
//  ValidateRule.m
//  TestTable
//
//  Created by CumminsTY on 2018/10/24.
//  Copyright © 2018 CumminsTY. All rights reserved.
//

#import "ValidateRule.h"
#import "ValidateTextField.h"

@interface ValidateRule()
@property (nonatomic,strong) NSMutableArray * validateTfArr;
@property (nonatomic,strong) NSMutableArray * validateArr;
@property (nonatomic,strong)UIViewController * vc;

@end
@implementation ValidateRule{
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validateArr = [NSMutableArray array];
        self.validateTfArr = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithController:(UIViewController*)vc
{
    self = [super init];
    if (self) {
        self.vc = vc;
        self.validateArr = [NSMutableArray array];
        self.validateTfArr = [NSMutableArray array];
    }
    return self;
}

#pragma mark  通用正则方法

/**
 *  递归view 找到textfield 放到数组中
 *
 *  @param views 需要循环的view
 *
 *  @return 返回一个数组
 */
- (NSArray *)vv:(NSArray *)views
{
    __weak typeof(self)weakSelf = self;
    [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[ValidateTextField class]] ){
            [weakSelf.validateArr addObject:obj];
        }else{
            [self vv:[obj subviews]];
        }
    }];
    return self.validateArr;
}


-(NSDictionary *)validateResultWithView:(id)view{
    if ([view isKindOfClass:[UIView class]]) {
        self.validateTfArr  = [NSMutableArray arrayWithArray:[self vv:[view subviews]]] ;
    }else{
        [self showAlertWithTitle:@"验证失败"];
        return @{@"result":@NO,@"message":@"验证失败"};
    }
    
    BOOL result = YES;
    for (int i = 0; i<self.validateTfArr.count; i++) {
        ValidateTextField * validateTf = self.validateTfArr[i];
        NSString * text = validateTf.text;
        NSString * emptyMsg = validateTf.emptyMsg;
        NSString * errorMsg = validateTf.errorMsg;
        NSString * validateRule = validateTf.validateRule;
        BOOL checked = NO;
        
        if (text.length<=0&&emptyMsg.length>0) {
            //empty
//            MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
//            HUD.labelFont = [UIFont systemFontOfSize:15.f];
//            HUD.mode = MBProgressHUDModeText;
//            HUD.labelText = emptyMsg;
//
//            HUD.removeFromSuperViewOnHide = YES;
//            [HUD hide:YES afterDelay:KDURATION];
            [self showAlertWithTitle:emptyMsg];
            return @{@"result":@NO,@"message":emptyMsg};
        }
        
        checked = [self validateRuleWithText:text rule:validateRule];
        result = checked&&result;
        if (!result) {
            // error
            [self showAlertWithTitle:errorMsg];
            return @{@"result":@NO,@"message":errorMsg};

            break;
        }
    }
    [self showAlertWithTitle:@"验证成功"];
    return @{@"result":@YES,@"message":@"验证成功"};
    
}
-(void)showAlertWithTitle:(NSString*)title{
    if (self.vc) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:title preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        [self.vc presentViewController:alert animated:YES completion:nil];
    }
    

}



- (BOOL) validateRuleWithText:(NSString *)text rule:(NSString *)rule

{
    //    preg_match("/^[\x{4e00}-\x{9fa5}a-zA-Z_]{2,16}$/u", $data);
    //    ^[a-zA-Z_\u4e00-\u9fa5]{2,16}$
    NSString *regex = rule;
    
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [test evaluateWithObject:text];
}





@end
