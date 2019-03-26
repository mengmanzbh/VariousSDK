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
    NSString *token = @"N2hjaDgxZU45eGg4eWRvWlM2UGlMZEUxOHRaYVBOdjgwUVcwaDVvWFBoUzBKcVBoNDNJam5mMzB5dWpMaFV0Uw==";
    NSString *str = [NSString stringWithFormat:@"token=%@", token];
    
    NSURL *url = [NSURL URLWithString:@"http://47.52.47.73:9009/stripcandy/getCustomOrders"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 设置请你去方法
    request.HTTPMethod = @"post";
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
