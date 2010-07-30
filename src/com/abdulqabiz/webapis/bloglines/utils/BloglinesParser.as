/**
	_________________________________________________________________________________________________________________

	BloglinesParser parses the OPML data of bloglines feeds.
	@class BloglinesParser (public)
	@author Abdul Qabiz (mail@abdulqabiz.com)
	@version 1.00 (10/22/2006)
	@availability 9.0+\n@usage
	<code>BloglinesParser.getInstance ();</code>
	@example
		<code>
			bloglinesParser = new BloglinesParser.getInstance ();
		</code>
	__________________________________________________________________________________________________________________

	*/

package com.abdulqabiz.webapis.bloglines.utils
{
	import com.abdulqabiz.webapis.bloglines.vo.Subscription;
	import com.abdulqabiz.webapis.bloglines.vo.OPMLData;

	public class BloglinesParser
	{
		//static attributes
		private static var instance:BloglinesParser = null;

		//static methods
		
		public static function getInstance ():BloglinesParser
		{
			if (!instance)
			{
				instance = new BloglinesParser ();
			}

			return instance;
		}

		//class attributes

		/*
			Public Methods
		*/
							
		public function parse(content:String):OPMLData
		{
	        var opml:XML = new XML(content);
			var data:OPMLData = new OPMLData();
			var subscriptionsArray:Array = [];
			data.title = opml.head.title;
			data.dateCreated = opml.head.dateCreated;
			data.ownerName = opml.head.ownerName;

			var subscriptions:XMLList = opml..outline.( hasOwnProperty("@title") && hasOwnProperty("@xmlUrl") );

			var subscription:Subscription;

			for each(var s:XML in subscriptions)
			{
				subscription = new Subscription ();
				subscription.title = s.@title;
				subscription.xmlUrl = s.@xmlUrl;
				subscription.htmlUrl = s.@htmlUrl;
				subscription.type = s.@type;
				subscription.bloglinesSubId = int(s.@BloglinesSubId);
				subscription.bloglinesIgnore = Boolean(s.@BloglinesIgnore);
				subscription.bloglinesUnread = int(s.@BloglinesUnread);
				subscriptionsArray.push(subscription);
				
			}
			data.subscriptions = subscriptionsArray;
			return data;
		}
	}
}
