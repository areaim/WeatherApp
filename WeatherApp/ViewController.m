//
//  ViewController.m
//  WeatherApp
//
//  Created by Mac on 3/22/18.
//  Copyright © 2018 Mac. All rights reserved.
//

#import "ViewController.h"
#import "DataController.h"

@interface ViewController ()

@property(strong,nonatomic)IBOutlet SVGKLayeredImageView *imgViewR;
@property(strong,nonatomic)IBOutlet SVGKLayeredImageView *imgViewG;
@property(strong,nonatomic)IBOutlet SVGKLayeredImageView *imgViewB;
@property(strong,nonatomic)IBOutlet UILabel *lblWeather;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
 
    [self setUI];
    [self getApiDataFromServer];
}
-(void)setUI{
 
    [self setBackgorundImage:@"RedCircle" withImageView:self.imgViewR];
    [self setBackgorundImage:@"GreenCircle" withImageView:self.imgViewG];
    [self setBackgorundImage:@"BlueCircle" withImageView:self.imgViewB];
 
 
}
-(void)setBackgorundImage:(NSString*)imageName withImageView:(SVGKLayeredImageView*)imageView{
    
    [imageView setImage:[SVGKImage imageNamed:imageName]];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.backgroundColor =[UIColor clearColor];
    
}

#pragma mark ===Weather API ====
-(void)getApiDataFromServer{
    NSString *apiKey=@"3878f8e7b7949dc0e99360fe9584238f";
    //NSString *apiKey=@"1174872&appid=b1b15e88fa797225412429c1c50c122a1";
    NSString*urlString=[NSString stringWithFormat:@"http://samples.openweathermap.org/data/2.5/forecast?id=%@",apiKey];
    NSURL *url =[[NSURL alloc]init];
    NSString* webStringURL = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    url =[NSURL URLWithString:webStringURL];
    NSString*testURL=[url absoluteString];
    
    NSDictionary *jsonDic =[[NSDictionary alloc]init];
   jsonDic =[[DataController staticVersion] startJSONParsing:testURL];
  
    NSString *weather  =  jsonDic[@"list"][0][@"wind"][@"deg"];
    NSLog(@"%@",weather);
    _lblWeather.text = [NSString stringWithFormat:@"Moscow Weather: %@",weather];
   
    
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
