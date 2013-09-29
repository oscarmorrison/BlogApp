BlogApp
=======

Basic iPhone app that displays blog posts, then presents the mobile version in a webview.

### Basic Documentation ###

(TableViewController)
The app uses the Google Feed API: https://developers.google.com/feed/v1/jsondevguide
to parse the blogs XML feed to JSON format. This is stored in a NSURL *blogURL. To add your own blog, change the end url (e.g zendesk.com/feed) The num=30, 30 being the amount of posts.

The contents of the URL are then stored in a NSData object called *jasonData.
Which is then serialised into NSDictionary object.

The next part creates an NSArray (could also use NSMutableArray for dynamic storage)
using the keys in the dictionary,

Lines 48 and 49 have been commented out are used to assist with indentifying the keys in the NSDictionary. 

For more information on JSON keys and JSON in general, 

Squarespace developers has a good basic introduction: http://developers.squarespace.com/what-is-json/

And for NSDictionary allKeys see iOS Developer Docs: https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSDictionary_Class/Reference/Reference.html#//apple_ref/occ/instm/NSDictionary/allKeys

The reset of the app is reasonable self-explanitary. The activity bar, UIProgressView is purley
for display purposes, it will load until site has finished loading, or about 2secs, whichever is faster. Although this is cosmetic, it is being used in the same context of that which a Activity indicator would be used, more information about the User Experience can be found in io design resources: https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIActivityIndicatorView.html


