// ActionScript file
/**
	_________________________________________________________________________________________________________________

	OPMLData is value object for Bloglines OPML.
	@class OPMLData(public)
	@author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 1.00 (10/22/2006)
	@availability 9.0+
	@usage
	<code>new OPMLData ();</code>
	@example
		<code>
			opmlData = new OPMData();
		</code>
	__________________________________________________________________________________________________________________

	*/

package com.abdulqabiz.webapis.bloglines.vo 
{
	
	import com.abdulqabiz.core.*;
	
	public class BloglinesOPMLOutline 
	{
		//class attributes
		private var _title:String;
		private var _dateCreated:String;
		private var _ownerName:String;
		[ArrayElementType("Subscription")]
		private var _subscriptions:Array;
			
		/*
			OPMLData's constructor
			*/	
		public function OPMLData (title:String = null, dateCreated:String = null, ownerName:String = null, subscriptions:Array = null)
		{
			if (title)
			{
				_title = title;
			}

			if (dateCreated)
			{
				_dateCreated = dateCreated;
			}

			if (ownerName)
			{
				_ownerName = ownerName;
			}

			if (subscriptions)
			{
				_subscriptions = subscriptions;
			}
		}

		public function toString ():String
		{
			return "[object com.abdulqabiz.webapis.bloglines.vo.OPMLData]";
		}
	
		/*
			Public Properties
		*/

		public function get title():String
		{
			return _title;
		}
		
		public function set title(value:String):void
		{
			_title = value;
		}		
		
		
		public function get dataCreated():String
		{
			return _dateCreated;
		}
		
		public function set dateCreated(value:String):void
		{
			_dateCreated = value;
		}
		
		
		public function get ownerName():String
		{
			return _ownerName;
		}
		
		public function set ownerName(value:String):void
		{
			_ownerName = value;
		}

		public function get subscriptions():Array
		{
			return _subscriptions;
		}
		public function set subscriptions(s:Array):void
		{
			_subscriptions = s;
		}
		
		
	
		
	}
}


