//
//  ModifyDateController.m
//  MolijieIos
//
//  Created by yexifeng on 16/6/21.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "ProxyController.h"
#import "AppDataTool.h"
#import "MBProgressHUD+MJ.h"
#import "AppDataMemory.h"
#import "SandBoxTool.h"
#import <CoreLocation/CoreLocation.h>
#import "AddressSelectController.h"
@interface ProxyController ()<CLLocationManagerDelegate>{
    NSString* _province ;
    NSString* _city ;
    NSString* _district;
    CLLocationManager *_locationManager;
}
@end

@implementation ProxyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请代理";
    [self.btnPCD.layer setBorderWidth:0.5f];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0.8f,0.8f,0.8f,1});
    [self.btnPCD.layer setBorderColor:color];
    [self initializeLocationService];
    [_locationManager startUpdatingLocation];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submit)];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            NSDictionary* elements = placemark.addressDictionary;
            NSString* city = elements[@"City"];
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            [self setPCD:elements[@"State"] city:city district:elements[@"SubLocality"]];
//            self.tfDetail.text = [NSString stringWithFormat:@"%@%@",elements[@"Thoroughfare"],elements[@"SubThoroughfare"]];
            
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
}

-(void)setPCD:(NSString*)province city:(NSString*)city district:(NSString*)district{
    _province =province;
    _city = city;
    _district = district;
    [_btnPCD setTitle:[NSString stringWithFormat:@"%@%@%@",province,city,district] forState:UIControlStateNormal];
}

-(void)initializeLocationService {
    // 初始化定位管理器
    _locationManager = [[CLLocationManager alloc] init];
    // 设置代理
    _locationManager.delegate = self;
    // 设置定位精确度到米
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // 设置过滤器为无
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    // 开始定位
    // 取得定位权限，有两个方法，取决于你的定位使用情况
    // 一个是requestAlwaysAuthorization，一个是requestWhenInUseAuthorization
    [_locationManager requestAlwaysAuthorization];//这句话ios8以上版本使用。
    
}

-(void)didPcdSelected:(NSString *)province city:(NSString *)city district:(NSString *)district{
    [self.navigationController popToViewController:self animated:true];
    [self setPCD:province city:city district:district];
}

- (IBAction)didSelectPCD:(id)sender {
    
    
    AddressSelectController* controller = [[AddressSelectController alloc] init];
    controller.delegate = self;
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navController animated:YES completion:nil];

}

-(void)submit{
    if(_province && _city && _district && _tfCompany.text && _tfName.text && _tfTel.text && _tfIM.text && _tfOwnResource.text && _tfOwnDevice.text && _tfScale){
        NSMutableDictionary* params = [NSMutableDictionary dictionary];
        [params setObject:_province forKey:@"province"];
        [params setObject:_city forKey:@"city"];
        [params setObject:_district forKey:@"cmbarea"];
        [params setObject:_tfCompany.text forKey:@"comname"];
        [params setObject:_tfName.text forKey:@"linker"];
        [params setObject:_tfTel.text forKey:@"tel"];
        [params setObject:_tfIM.text forKey:@"chattool"];
        [params setObject:_tfOwnDevice.text forKey:@"ibeaconnum"];
        [params setObject:_tfOwnResource.text forKey:@"source"];
        [params setObject:_tfScale.text forKey:@"scale"];
        [AppDataTool applyingAgency:params response:^(BOOL result) {
            if(result){
                [MBProgressHUD showSuccess:@"申请已成功提交！"];
                [self.navigationController popViewControllerAnimated:true];
            }else{
                [MBProgressHUD showError:@"申请失败"];
            }
        } onError:^(int errorCode, NSString *msg) {
            [MBProgressHUD showError:msg];
        }];

    }else{
        [MBProgressHUD showError:@"打*号的都是必填项！"];
    }
}

//键盘显示时将底部工具栏移动到键盘之上
-(void)keyboardWillShow:(NSNotification*)notifaction{
    NSValue* value = notifaction.userInfo[UIKeyboardBoundsUserInfoKey];
    CGFloat keyBoardHeight = value.CGRectValue.size.height;
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.transform = CGAffineTransformMakeTranslation(0, -keyBoardHeight);
    } completion:^(BOOL finished) {
        
    }];
}

//键盘隐藏时将底部工具栏还原到原来位置
-(void)keyboardWillHidden:(NSNotification*)notifaction{
    self.scrollView.transform = CGAffineTransformIdentity;//还原动画之前的位置
}

@end
