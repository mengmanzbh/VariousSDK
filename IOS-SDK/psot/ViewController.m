//
//  ViewController.m
//  psot
//
//  Created by dilireba on 2019/3/26.
//  Copyright © 2019 dilireba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *name = @"zhangsan";
    NSString *train_date = @"2019-04-19";
    NSString *is_accept_standing = @"yes";
    NSString *choose_seats = @"1A2B2C";
    NSString *from_station_code = @"SZH";
    NSString *to_station_code = @"SZH";
    NSString *checi = @"G7027";
    
    NSMutableDictionary *passenger=[NSMutableDictionary dictionaryWithCapacity:3];
    [passenger setObject:@1 forKey:@"passengerid"];
    [passenger setObject:@"张三" forKey:@"passengersename"];
    [passenger setObject:@"1" forKey:@"piaotype"];
    [passenger setObject:@"1" forKey:@"piaotype"];
    [passenger setObject:@"成人票" forKey:@"piaotypename"];
    [passenger setObject:@"1" forKey:@"passporttypeseid"];
    [passenger setObject:@"二代身份证" forKey:@"passporttypeseidname"];
    [passenger setObject:@"420205199207231234" forKey:@"passportseno"];
    [passenger setObject:@"763.5" forKey:@"price"];
    [passenger setObject:@"M" forKey:@"zwcode"];
    [passenger setObject:@"一等座" forKey:@"zwname"];
    
    
    NSMutableArray *mutArray = [NSMutableArray array];
    [mutArray addObject:passenger];
    NSString *passengers = [mutArray componentsJoinedByString:@","];
    
    NSLog(@"%@", passengers);
    
    NSString *str = [NSString stringWithFormat:@"train_date=%@&is_accept_standing=%@&choose_seats=%@&from_station_code=%@&to_station_code=%@&checi=%@&passengers=%@", train_date,is_accept_standing,choose_seats,from_station_code,to_station_code,checi,passengers];
    
    NSLog(@"%@", str);
    
    NSURL *url = [NSURL URLWithString:@"http://47.52.47.73:9000/trainTickets/submit"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"akc3NEpnd0l1a1hzVUFmajEwODhkbmI2Z1hxYXFlWjhwMDVXYkpwdEljckZPSVNlMjRxeEs4b1hXTXI1QzB5VQ==" forHTTPHeaderField:@"Authorization"];
    [request setValue:@"62d92e0fa42acd4cea457948cd288e6922db044aee919c6e798e94cc5083da5e76f99b31c4affb00ce3461b8474bcf4370566f071c05bba46587703486ab692516ff1c7c18dc73c39d20f6fee39c43ded780bce548f6f6f527c44bbfda407008dacb59937db6323bc66c847e7b89bb8e798f18549d9bab95f765d73ee733dacd00aafdfb8a92fe466618a3b527fca22c5092f7abf1d9b9af34dacaacca50732b" forHTTPHeaderField:@"Cookie"];
    // 设置请你去方法
    request.HTTPMethod = @"POST";
    // 设置请求体
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:
     ^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
         if (connectionError) {
             NSLog(@"连接错误 %@", connectionError);
             return;
         }
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
             // 解析数据
             NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             NSLog(@"%@", dict);
         } else {
             NSLog(@"服务器内部错误");
         }
     }];
    
}


@end
