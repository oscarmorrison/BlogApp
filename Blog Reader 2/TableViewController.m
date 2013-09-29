//
//  TableViewController.m
//  Blog Reader 2
//
//  Created by Oscar Morrison on 12/09/13.
//  Copyright (c) 2013 ocodaa. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"

@interface TableViewController ()
@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    //Tech Blog
    NSURL *blogURL = [NSURL URLWithString:@"http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=30&q=http://www.zendesk.com/feed"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error: &error];

    self.blogPosts = [[NSMutableArray array] init];
    
    NSArray *blogPostsArray = [[[dataDictionary objectForKey:@"responseData"] objectForKey:@"feed"] objectForKey:@"entries"];
    
/*    NSArray *blogPostsArray2 = [dataDictionary allKeys];
    NSLog(@"Keys %@", blogPostsArray2); */


    
    for (NSDictionary *bpDictionary in blogPostsArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.snippet = [bpDictionary objectForKey:@"contentSnippet"];
        blogPost.url = [NSURL URLWithString: [bpDictionary objectForKey:@"link"]];
        [self.blogPosts addObject:blogPost];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];

//    cell.imageView.image = [UIImage imageNamed: @"lines.png"];
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", blogPost.snippet];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if( [segue.identifier isEqualToString:@"showBlogPost"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex: indexPath.row];
        [segue.destinationViewController setBlogPostURL: blogPost.url];
    }
}


@end
