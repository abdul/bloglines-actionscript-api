/**
	_________________________________________________________________________________________________________________

	BloglinesGetItemsResultEvent is event class for bloglines services.
	@class BloglinesGetItemsResultEvent (public)
	@author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 1.00 (10/22/2006)
	@availability 6.0+\n@usage
	<code>new BloglinesGetItemsResultEvent ();</code>
	@example
		<code>
			bloglinesGetItemsResultEvent = new BloglinesGetItemsResultEvent ()
	</code>
	__________________________________________________________________________________________________________________

	*/

package com.abdulqabiz.webapis.bloglines.events
{
	
	import flash.events.Event;
	import com.abdulqabiz.webapis.bloglines.vo.Subscription;

	public class BloglinesGetItemsResultEvent extends BloglinesResultEvent 
	{
		
		//class attributes
		public var data:XML;
						
		public function BloglinesGetItemsResultEvent(data:XML = null, success:Boolean = false) 
		{
			super(BloglinesResultEvent.ON_GET_ITEMS_RESULT, false, false, success);
			this.data = data;
		}

		public override function toString ():String
		{
			return "[object com.abdulqabiz.webapis.bloglines.events.BloglinesGetItemsResultEvent]";
		}

	/*__________________________________________________________________________________________________________________

		Public Properties
		__________________________________________________________________________________________________________________
	*/		
	}
}

