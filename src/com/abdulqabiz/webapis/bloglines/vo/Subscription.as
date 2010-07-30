/**
	_________________________________________________________________________________________________________________

	Subscription is value object for Bloglines subscription.
	@class Subscription(public)
	@author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 1.00 (10/22/2006)
	@availability 9.0+
	@usage
	<code>new Subscription ();</code>
	@example
		<code>
			subscription = new Subscription();
		</code>
	__________________________________________________________________________________________________________________

	*/

package com.abdulqabiz.webapis.bloglines.vo 
{

	
	public class Subscription
	{

		//class attributes
		private var _title:String;
		private var _xmlUrl:String;
		private var _htmlUrl:String;
		private var _type:String;
		private var _bloglinesSubId:uint;
		private var _bloglinesIgnore:Boolean;
		private var _bloglinesUnread:uint;

	
		
		/**
			Subscription's constructor
			*/
		public function Subscription ()
		{
			super ();
		}


		public function toString ():String
		{
			return "[object com.abdulqabiz.webapis.bloglines.vo.Subscription]";
		}

		public function get title():String
		{
			return _title;
		}
		
		public function set title(value:String):void
		{
			_title = value;
		}		
		
		
		public function get xmlUrl():String
		{
			return _xmlUrl;
		}
		
		public function set xmlUrl(value:String):void
		{
			_xmlUrl = value;
		}
		
		
		public function get htmlUrl():String
		{
			return _htmlUrl;
		}
		
		public function set htmlUrl(value:String):void
		{
			_htmlUrl = value;
		}
		
		
		public function get type():String
		{
			return _type;
		}
		
		public function set type(value:String):void
		{
			_type = value;
		}		
		
			
		public function get bloglinesSubId():uint
		{
			return _bloglinesSubId;
		}
		
		public function set bloglinesSubId(value:uint):void
		{
			_bloglinesSubId = value;
		}
		
		
		public function get bloglinesIgnore():Boolean
		{
			return _bloglinesIgnore;
		}
		
		public function set bloglinesIgnore(value:Boolean):void
		{
			_bloglinesIgnore = value;
		}
		
	
		public function get bloglinesUnread():uint
		{
			return _bloglinesUnread;
		}
		
		public function set bloglinesUnread(value:uint):void
		{
			_bloglinesUnread = value;
		}
		
	}
}

