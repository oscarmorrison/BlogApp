//
//  BlogPost.m
//  Blog Reader 2
//
//  Created by Oscar Morrison on 13/09/13.
//  Copyright (c) 2013 ocodaa. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *)title{
    self = [super init];
    
    if(self){
        self.title = title;
        self.snippet = nil;
        self.author = nil;
    }
    
    return self;
}

+ (id) blogPostWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle: title];
}



@end
