## ![eppz!tools](http://eppz.eu/beacons/eppz!cell.png) eppz!cell
Sample code for the article [Custom UITableViewCell from Xib with ease](http://eppz.eu/blog/custom-uitableviewcell-from-xib/) at [blog.eppz.eu](http://eppz.eu/blog).
___
As it is common among these articles, the main point is always to **keep the client code clean**, resulting in some reusable, extendable class for everyday use. This article will just do the same. Ending up in a custom [TechCrunch](http://www.techcrunch.com) themed table with **instantiating each UITableViewCell from Xib file**, with a lovely one-liner hook towards the clients. I’ve found a public [FeedBurner](http://feedburner.google.com) feed of the recent TechCrunch articles, hence the theme inspiration.

**Donate eppz!cell** by <a href="https://twitter.com/intent/tweet?text=A%20TechCrunch%20feed%20reader%20with%20custom%20design%20in%205%20lines%20of%20client%20code:%20http://bit.ly/12oidK1%20t.co/lDo7Vixce4%20@_eppz&hashtags=iosdev,uikit"><img src="http://eppz.eu/beacons/eppz!_tweet.png" align="absmiddle"></a> this or follow <a href="https://twitter.com/intent/user?original_referer=https%3A%2F%2Ftwitter.com%2Fabout%2Fresources%2Fbuttons&region=following&screen_name=_eppz&tw_p=followbutton&variant=2.0"><img src="http://eppz.eu/beacons/eppz!_follow.png" align="absmiddle"></a>

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
___
Keep reading [Custom UITableViewCell from Xib with ease](http://eppz.eu/blog/custom-uitableviewcell-from-xib/) at [blog.eppz.eu](http://eppz.eu/blog).
#### License
> Licensed under the [Open Source MIT license](http://en.wikipedia.org/wiki/MIT_License).

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/83efbd77ad865b1d7d2646907be3238f "githalytics.com")](http://githalytics.com/eppz/eppz-cell)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/eppz/eppz-cell/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

