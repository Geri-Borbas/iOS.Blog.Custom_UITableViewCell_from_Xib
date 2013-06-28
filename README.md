## ![eppz!tools](http://www.eppz.eu/beacons/eppz!cell.png) eppz!cell
Sample code for the article [Custom UITableViewCell from Xib with ease](http://eppz.eu/blog/custom-uitableviewcell-from-xib/) at [blog.eppz.eu](http://eppz.eu/blog).
- - -
As it is common among these articles, the main point is always to **keep the client code clean**, resulting in some reusable, extendable class for everyday use. This article will just do the same. Ending up in a custom [TechCrunch](http://www.techcrunch.com) themed table with **instantiating each UITableViewCell from Xib file**, with a lovely one-liner hook towards the clients. I’ve found a public [FeedBurner](http://feedburner.google.com) feed of the recent TechCrunch articles, hence the theme inspiration.

![Custom UITableViewCell from Xib with ease](http://eppz.eu/blog/wp-content/uploads/eppzcell_01.png)

Having some well designed base class, the concrete implementation can free of any boilerplate code focusing only on design details.
```Objective-C
-(UITableViewCell*)tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    return [TCItemCell cellForTableView:tableView
                            atIndexPath:indexPath
                        withModelSource:self];
}
```
As you can see, all the instantiating, dequeue/reuse code, and configuring with model object is encapsulated within the actual `UITableViewCell` subclass. It uses a base class `EPPZTableViewCell : NSObject` to be introduced soon below, then extending it by adding some concrete features of the TechCrunch themed custom `UITableViewCell`.
- - -
Keep reading the full article [Custom UITableViewCell from Xib with ease](http://eppz.eu/blog/custom-uitableviewcell-from-xib/) at [blog.eppz.eu](http://eppz.eu/blog).
<img src="http://www.eppz.eu/beacons/eppz!cell.png"></img>
<iframe width="60" height="60" src="http://www.eppz.eu/beacons/eppz!cell.png"></iframe>
#### License
> Licensed under the [Open Source MIT license](http://en.wikipedia.org/wiki/MIT_License).
