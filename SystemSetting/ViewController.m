//
//  ViewController.m
//  SystemSetting
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 agewnetLV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *settingTableView;
    NSMutableArray *settingArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSArray *array = @[
                       @{@"About"                   :@"prefs:root=General&path=About"},
                       @{@"Accessibility"           :@"prefs:root=General&path=ACCESSIBILITY"},
                       @{@"Airplane Mode On"        :@"prefs:root=AIRPLANE_MODE"},
                       @{@"Auto-Lock"               :@"prefs:root=General&path=AUTOLOCK"},
                       @{@"Brightness"              :@"prefs:root=Brightness"},
                       @{@"Bluetooth"               :@"prefs:root=General&path=Bluetooth"},
                       @{@"Date & Time "            :@"prefs:root=General&path=DATE_AND_TIME"},
                       @{@"FaceTime"                :@"prefs:root=FACETIME"},
                       @{@"General"                 :@"prefs:root=General"},
                       @{@"Keyboard"                :@"prefs:root=General&path=Keyboard"},
                       @{@"iCloud"                  :@"prefs:root=CASTLE"},
                       @{@"iCloud Storage & Backup ":@"prefs:root=CASTLE&path=STORAGE_AND_BACKUP"},
                       @{@"International"           :@"prefs:root=General&path=INTERNATIONAL"},
                       @{@"Location Services"       :@"prefs:root=LOCATION_SERVICES"},
                       @{@"Music"                   :@"prefs:root=MUSIC"},
                       @{@"Music Equalizer"         :@"prefs:root=MUSIC&path=EQ"},
                       @{@"Music Volume Limit"      :@"prefs:root=MUSIC&path=VolumeLimit"},
                       @{@"Network"                 :@"prefs:root=General&path=Network"},
                       @{@"Nike + iPod"             :@"prefs:root=NIKE_PLUS_IPOD"},
                       @{@"Notes"                   :@"prefs:root=NOTES"},
                       @{@"Notification"            :@"prefs:root=NOTIFICATIONS_ID"},
                       @{@"Phone"                   :@"prefs:root=Phone"},
                       @{@"Photos"                  :@"prefs:root=Photos"},
                       @{@"Profile"                 :@"prefs:root=General&path=ManagedConfigurationList"},
                       @{@"Reset"                   :@"prefs:root=General&path=Reset"},
                       @{@"Safari"                  :@"prefs:root=Safari"},
                       @{@"Siri"                    :@"prefs:root=General&path=Assistant"},
                       @{@"Sounds"                  :@"prefs:root=Sounds"},
                       @{@"Software Update"         :@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"},
                       @{@"Store"                   :@"prefs:root=STORE"},
                       @{@"Twitter"                 :@"prefs:root=TWITTER"},
                       @{@"Usage"                   :@"prefs:root=General&path=USAGE"},
                       @{@"VPN"                     :@"prefs:root=General&path=Network/VPN"},
                       @{@"Wallpaper"               :@"prefs:root=Wallpaper"},
                       @{@"Wi-Fi"                   :@"prefs:root=WIFI"},
                       @{@"Setting"                 :@"prefs:root=INTERNET_TETHERING"}
                       ];
    settingArray = [NSMutableArray arrayWithArray:array];
    
    
    
    
    
    /*
     About — prefs:root=General&path=About
     Accessibility — prefs:root=General&path=ACCESSIBILITY
     Airplane Mode On — prefs:root=AIRPLANE_MODE
     Auto-Lock — prefs:root=General&path=AUTOLOCK
     Brightness — prefs:root=Brightness
     Bluetooth — prefs:root=General&path=Bluetooth
     Date & Time — prefs:root=General&path=DATE_AND_TIME
     FaceTime — prefs:root=FACETIME
     General — prefs:root=General
     Keyboard — prefs:root=General&path=Keyboard
     iCloud — prefs:root=CASTLE
     iCloud Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
     International — prefs:root=General&path=INTERNATIONAL
     Location Services — prefs:root=LOCATION_SERVICES
     Music — prefs:root=MUSIC
     Music Equalizer — prefs:root=MUSIC&path=EQ
     Music Volume Limit — prefs:root=MUSIC&path=VolumeLimit
     Network — prefs:root=General&path=Network
     Nike + iPod — prefs:root=NIKE_PLUS_IPOD
     Notes — prefs:root=NOTES
     Notification — prefs:root=NOTIFICATIONS_ID
     Phone — prefs:root=Phone
     Photos — prefs:root=Photos
     Profile — prefs:root=General&path=ManagedConfigurationList
     Reset — prefs:root=General&path=Reset
     Safari — prefs:root=Safari
     Siri — prefs:root=General&path=Assistant
     Sounds — prefs:root=Sounds
     Software Update — prefs:root=General&path=SOFTWARE_UPDATE_LINK
     Store — prefs:root=STORE
     Twitter — prefs:root=TWITTER
     Usage — prefs:root=General&path=USAGE
     VPN — prefs:root=General&path=Network/VPN  
     Wallpaper — prefs:root=Wallpaper  
     Wi-Fi — prefs:root=WIFI  
     Setting —prefs:root=INTERNET_TETHERING 
     */
    
    
    
    
    settingTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:settingTableView];
    settingTableView.dataSource = self;
    settingTableView.delegate = self;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return settingArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    NSDictionary *dic = settingArray [indexPath.row];
    
    NSString *key =[dic allKeys][0];
    NSString *value = [dic valueForKey:key];
    cell.textLabel.text = key;
    cell.detailTextLabel.text = value;
    
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = settingArray [indexPath.row];
    
    NSString *key =[dic allKeys][0];
    NSString *value = [dic valueForKey:key];
    NSURL*url=[NSURL URLWithString:value];
    
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
