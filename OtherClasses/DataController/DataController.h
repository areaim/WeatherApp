//
//  DataController.h
//  TestJson
//
//  Created by Asif Hussain on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataController : NSObject {
    
}
+ (id)staticVersion;
- (NSMutableArray *) startParsing:(NSString *)theURLString;
- (NSDictionary *) startJSONParsing:(NSString *)theURLString;
@end
