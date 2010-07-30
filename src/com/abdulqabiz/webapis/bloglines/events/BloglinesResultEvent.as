/**
	_________________________________________________________________________________________________________________

	BloglinesResultEvent is event class for bloglines services.
	@class BloglinesResultEvent (public)
	@author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 1.00 (10/22/2006)
	@availability 6.0+\n@usage
	<code>new BloglinesResultEvent ();</code>
	@example
		<code>
			bloglinesResultEvent = new BloglinesResultEvent ()
	</code>
	__________________________________________________________________________________________________________________

	*/

package com.abdulqabiz.webapis.bloglines.events
{
	
	import flash.events.Event;

	public class BloglinesResultEvent extends Event 
	{
		//class attributes	
		public static const ON_LIST_SUBS_RESULT:String = "onListSubsResult";		
		public static const ON_GET_ITEMS_RESULT:String = "onGetItemsResult";		
		
		//class attributes
		public var success:Boolean;
		


				
		public function BloglinesResultEvent(type:String, bubbles:Boolean = false,
								 cancelable:Boolean = false, success:Boolean = false) 
		{
			super(type, bubbles, cancelable);
			this.success = success;
		}

		public override function toString ():String
		{
			return "[object com.abdulqabiz.webapis.bloglines.events.BloglinesResultEvent]";
		}

	/*__________________________________________________________________________________________________________________

		Public Properties
		__________________________________________________________________________________________________________________
	*/

	}
}

