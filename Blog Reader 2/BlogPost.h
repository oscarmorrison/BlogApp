//
//  BlogPost.h
//  Blog Reader 2
//
//  Created by Oscar Morrison on 13/09/13.
//  Copyright (c) 2013 ocodaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *snippet;
@property(nonatomic, strong) NSString *author;
@property(nonatomic, strong) NSURL *url;


//designated initialiser
- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *)title;





@end
