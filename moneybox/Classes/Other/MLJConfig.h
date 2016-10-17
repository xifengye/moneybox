//
//  Config.h
//  MolijieIos
//
//  Created by yexifeng on 16/5/18.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIActionHandler)(UIAlertAction *action);


@interface MLJConfig : UIView
#define MBBLUE_COLOR  [UIColor colorWithRed:0 green:149.0/255 blue:242.0/255 alpha:1]
#define mljBarHeight    49
#define mljLabelFont  [UIFont systemFontOfSize:14]

#define NOTIFYCATION_UPDATE_ADDRESS @"update_address"
#define NOTIFYCATION_SELECT_ADDRESS_PCD @"select_address_pcd"
#define PUSH_TOKEN_KEY  @"push_token"

#define article_url @"http://112.124.61.35:9999/Weekly/"

#define SUGGEST_MAX_LEN 500


#define alipay_partner  @"2088121324952881"
#define alipay_seller  @"business_at_cnmolijie@outlook.com"
#define alipay_privateKey  @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBANsaAYKJAsFe6TM0QiwQZTZPHkY2HCg42FXpa/XbzLW8tUnwGdmPIeXZ7/tFj8om8mAGnT4/UfPzAndjCOuWVmlyOsV4GsvdyvrmEF9wjnUTcF37aP6POqWUcKngeedaLcHV9BBbhqurupVPvFl6ZoB8OXWktWNySfgiH8/Spx9JAgMBAAECgYAQd+3xH9dDLZ0dqinnIfxZjqzZ3itToqIwIvFoc3L5nguKWS+4OJf1rOHq4xmhujexnA2pphzE11kyHBGJk60+8BHTA7B/QGyuYIImGEG8yM06dr/82vKp7ni3Jeqyz4FtpMiYjTlIkerxomQoTnTEo7Ho2btuVoNZmw2GK8Ir2QJBAP7+Dwd3wMMCozdVSanMpVkBmVAe6UbqchuvvQMMzeOKcbB/qptytI+Cl/eXNw7dSpiAkLHyrskJypUpV/0HmTcCQQDb96QsECEyEXkxWplXWA1V7HfBgjr2pI2hkVdea+sYqlI2zMeQy21UXuLFSoQXFQ30AxPybyK8FGnq99wReUt/AkEA09zbN+Uz79NdMThXwBEcwNsnOv6z7AwXSxG1Bbe5yXjaBT/NzOJ9S0/CXCDzyhHrTNJlZrSwrLDJ9S0owj9x+QJAdhx05MwMZwwG3T9ekw3Oq1J7w0YgTwtwmU6ncSXVaLsbxh0TE2aH4APLFFC8uIAvq9RzQ3v1VLRJY0ePvTo6FQJBALLswOrb0n90KawRnGu0dwFm+r2SQ3T6ruRms04LBZJaVTXJEbCPK1vl/QSrn+NEJ1yuNp/Ur5fp3QZPcS6i510="

#define alipay_notifyPayUrl    @"http://www.cnmolijie.com/alipaynotify/"

#define NOTIFICATION_PAY_SUCCESS    @"notification_pay_success"
#define NOTIFICATION_PAY_FAILURE    @"notification_pay_failure"

+ (NSString *)getCurrentDeviceModel;
@end
