/**
	_________________________________________________________________________________________________________________

	BloglinesListSubsResultEvent is event class for bloglines services.
	@class BloglinesListSubsResultEvent (public)
	@author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 1.00 (10/22/2006)
	@availability 6.0+\n@usage
	<code>new BloglinesListSubsResultEvent ();</code>
	@example
		<code>
			bloglinesListSubsResultEvent = new BloglinesListSubsResultEvent ()
	</code>
	__________________________________________________________________________________________________________________

	*/

package com.abdulqabiz.webapis.bloglines.events
{
	
	import flash.events.Event;
	import com.abdulqabiz.webapis.bloglines.vo.OPMLData;

	public class BloglinesListSubsResultEvent extends BloglinesResultEvent 
	{	
		//class attributes
		public var data:OPMLData;
		public var rawData:String;
				
		public function BloglinesListSubsResultEvent(data:OPMLData = null, rawData:String = null, success:Boolean = false) 
		{
			super(BloglinesResultEvent.ON_LIST_SUBS_RESULT, false, false, success);
			this.data = data;
			this.success = success;
		}

		public override function toString ():String
		{
			return "[object com.abdulqabiz.webapis.bloglines.events.BloglinesListSubsResultEvent]";
		}

	/*__________________________________________________________________________________________________________________

		Public Properties
		__________________________________________________________________________________________________________________
	*/		
	
	}
}

