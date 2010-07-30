/**
	_________________________________________________________________________________________________________________

	BloglinesFaultEvent is fault event for bloglines services.
	@class BloglinesFaultEvent (public)
	@author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 1.00 (10/22/2006)
	@availability 6.0+\n@usage
	<code>new BloglinesFaultEvent ();</code>
	@example
		<code>
			bloglinesFaultEvent = new BloglinesFaultEvent ()
	</code>
	__________________________________________________________________________________________________________________

	*/

package com.abdulqabiz.webapis.bloglines.events
{
	
	import flash.events.Event;

	public class BloglinesFaultEvent extends Event 
	{
		//class attributes	
		public static const ERROR:String = "error";	
		public static const LOGIN_ERROR:String  = "loginError";	
		
		//class attributes
		public var message:String = "";
		public var errorCode:int;
		


				
		public function BloglinesFaultEvent(type:String, bubbles:Boolean = false,
								 cancelable:Boolean = false, message:String = null, errorCode:int = -1) 
		{
			super(type, bubbles, cancelable);
			this.message = message;
			this.errorCode = errorCode;
		}

		public override function toString ():String
		{
			return "[object com.abdulqabiz.webapis.bloglines.events.BloglinesFaultEvent]";
		}

	/*__________________________________________________________________________________________________________________

		Public Properties
		__________________________________________________________________________________________________________________
	*/		
		


	}
}

