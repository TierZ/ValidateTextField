//
//  ValidateTextField.h
//  TestTable
//
//  Created by CumminsTY on 2018/10/24.
//  Copyright © 2018 CumminsTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValidateTextField : UITextField
@property (nonatomic,copy)NSString * errorMsg;
@property (nonatomic,copy)NSString * emptyMsg;
@property (nonatomic,copy)NSString * validateRule;
@end
