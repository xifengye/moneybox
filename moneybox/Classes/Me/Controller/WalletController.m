//
//  AddressEditController.m
//  MolijieIos
//
//  Created by yexifeng on 16/6/9.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "WalletController.h"
#import "AppDataMemory.h"
#import "AppDataTool.h"
#import "MLJConfig.h"
#import "MBProgressHUD+MJ.h"
#import <CoreLocation/CoreLocation.h>


@interface WalletController()<CLLocationManagerDelegate>{
    NSString* _province ;
    NSString* _city ;
    NSString* _district;
    CLLocationManager *_locationManager;
}
@end

@implementation WalletController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"我的钱包";
    [self initializeLocationService];
}




-(void)invoke{
    }

- (IBAction)didLocate:(id)sender {
    // 开始定位
     [_locationManager startUpdatingLocation];
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
            self.tfDetail.text = [NSString stringWithFormat:@"%@%@",elements[@"Thoroughfare"],elements[@"SubThoroughfare"]];
            
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




@end
