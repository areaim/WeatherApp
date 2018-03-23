//
//  DataController.m
//  TestJson
//
//  Created by Asif Hussain on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DataController.h"
#import "SBJSON.h"


@implementation DataController
DataController *theInstance;


+ (id)staticVersion{
    if(!theInstance){
        theInstance = [[DataController alloc] init];
    }
    return theInstance;
}

- (NSMutableArray *) startParsing:(NSString *)theURLString
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",theURLString]];
    NSString *fileContent = [NSString stringWithContentsOfURL: url encoding:NSUTF8StringEncoding error:nil];
   
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *data = (NSDictionary *) [parser objectWithString:fileContent error:nil];
    NSMutableArray *items = (NSMutableArray *) data ;
    return items;
}
- (NSDictionary *) startJSONParsing:(NSString *)theURLString{

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",theURLString]];
    NSString *fileContent = [NSString stringWithContentsOfURL: url encoding:NSUTF8StringEncoding error:nil];
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *data = (NSDictionary *) [parser objectWithString:fileContent error:nil];
  //  NSDictionary *items = (NSDictionary *) data ;
    return data;

}
@end
