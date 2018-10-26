//
//  ValidateRule.h
//  TestTable
//
//  Created by CumminsTY on 2018/10/24.
//  Copyright © 2018 CumminsTY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define PhoneRule  @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0-9])|(14[0-9]))\\d{8}$"
#define VerifyRule  @"^[0-9]{6}$"
#define LoginAccount  @"^[.a-zA-Z_0-9-@\u4E00-\u9FA5]{2,32}$"

#define PwdRule @"^[.a-zA-Z_0-9-!@#$%&*()]{6,32}$"
#define NickRule @"^[a-zA-Z_\u4e00-\u9fa5]{2,16}$"
#define EmailRule @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define RealNameRule @"[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,8})*"
#define BankNoRule @"^[0-9]{16,21}$"
#define BandAddressRule @"^[A-Za-z0-9\u4E00-\u9FA5_-]+$"
#define NumberRule @"^[0-9]+([.]{0,1}[0-9]{0,2}+){0,1}$"
#define BankNameRule @"^[~\u4e00-\u9fa5]{4,30}$"
#define IdentifyRule @"^(\\d{14}|\\d{17})([0-9]|[xX])$"
#define FeedBackContact @"^(((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0-9])|(14[0-9]))\\d{8})|([1-9]\\d{5,9})$"

@interface ValidateRule : NSObject

-(NSDictionary *)validateResultWithView:(id)view;
- (instancetype)initWithController:(UIViewController*)vc;
@end
