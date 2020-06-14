//
//  MainVc.m
//  Bluetooth
//
//  Created by Apple on 2020/6/5.
//  Copyright © 2020 Apple. All rights reserved.
//

/*
    1, 建立连接
    2, 扫描外部设备
    3, 连接外部设备
    4, 扫描服务和特征
    5, 数据交互
    6, 断开连接
 */

#import "MainVc.h"

#import <CoreBluetooth/CoreBluetooth.h>

@interface MainVc () <CBCentralManagerDelegate, CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager *cbCentralManager;

@property (nonatomic, strong) CBPeripheral *cbPeripheral;

@end



@implementation MainVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.cbCentralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
}


#pragma mark - CBCentralManagerDelegate
/*
 CBCentralManagerStateUnknown = CBManagerStateUnknown,
 CBCentralManagerStateResetting = CBManagerStateResetting,
 CBCentralManagerStateUnsupported = CBManagerStateUnsupported,
 CBCentralManagerStateUnauthorized = CBManagerStateUnauthorized,
 CBCentralManagerStatePoweredOff = CBManagerStatePoweredOff,
 CBCentralManagerStatePoweredOn = CBManagerStatePoweredOn,
 */
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"%ld", central.state);
    if (central.state == CBCentralManagerStatePoweredOn) {
        [self.cbCentralManager scanForPeripheralsWithServices:nil options:nil];
    }
    
}

// 发现外部设备
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
//    NSLog(@"peripheral: %@", peripheral);
    self.cbPeripheral = peripheral;
    self.cbPeripheral.delegate = self;
    [self.cbCentralManager connectPeripheral:peripheral options:nil];
}

// 连接外设成功
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"peripheral: %@", peripheral);
    [self.cbPeripheral discoverServices:nil];
}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    NSLog(@"services: %@", peripheral.services);
    for (CBService *service in peripheral.services) {
        // 扫描 service 中所有的特征
        [self.cbPeripheral discoverCharacteristics:nil forService:service];
    }
}

// 发现 service 中所有的特征
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverIncludedServicesForService:(CBService *)service error:(NSError *)error {
    NSLog(@"%@", service.characteristics);
    
}

#pragma mark - CBPeripheralDelegate



#pragma mark -

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


