/**
	_________________________________________________________________________________________________________________

	BloglinesService class AS3 interface for Bloglines API. 

	@class BloglinesService (public)
	@author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 1.1 (10/21/2006)
	@version 1.00 (2/6/2006)
	@availability 9.0+
	@usage <code>new BloglinesService ();</code>
	@example
		<code>
			bloglinesService = new BloglinesService ();
		</code>
	@events BloglinesResultEvent.ON_LIST_SUBS_RESULT
	@events BloglinesResultEvent.ON_GET_ITEMS_RESULT
	__________________________________________________________________________________________________________________

	*/
package com.abdulqabiz.webapis.bloglines
{


	import flash.events.*;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import mx.utils.StringUtil;
	import com.abdulqabiz.net.HTTPURLLoader;
	import com.abdulqabiz.crypto.Base64;
	import com.abdulqabiz.webapis.bloglines.vo.*;
	import com.abdulqabiz.webapis.bloglines.utils.*;
	import com.abdulqabiz.webapis.bloglines.events.*;
	import flash.net.SharedObject;
	

	public class BloglinesService extends EventDispatcher
	{
			
	
		[Event(name="onListSubsResult", 
			 type="com.abdulqabiz.webapis.bloglines.events.BloglinesResultEvent.ON_LIST_SUBS_RESULT")]			
	
		[Event(name="onGetItemsResult", 
			 type="com.abdulqabiz.webapis.bloglines.events.BloglinesResultEvent.ON_GET_ITEMS_RESULT")]	
		
		public static const END_POINT:String = "http://rpc.bloglines.com/";

		private var _username:String = "";
		private var _password:String = "";
		private var _credentials:String = "";
		private var _opmlData:OPMLData;
		private var loginSuccess:Boolean = true;
		private var _so:SharedObject;

	/**
		BloglinesService's constructor function

		@example
			<code>
				new BloglinesService (username, password);
			</code>

		*/	
		public function BloglinesService(username:String = null, password:String = null)
		{
			super();
			if (username && password)
			{
				_username = username;
				_password = password;			
			
				_credentials = Base64.encode(_username + ":" + _password);
				//trace("base64: " + _credentials);
			}
			_so = SharedObject.getLocal ("bloglinesServiceStorage");
		}

 	/*__________________________________________________________________________________________________________________

		Public Methods
		__________________________________________________________________________________________________________________
	*/

		// for tracing purposes.
		public override function toString ():String 
		{
			return "[object com.abdulqabiz.webapis.bloglines.BloglinesService]";
		}
		
		public function setCredentials (username:String, password:String):void
		{
			_username = username;
			_password = password
			_credentials = Base64.encode(_username + ":" + _password);
		}
		
		public function getCredentials ():Object
		{
			return {username:_username, password:_password};
		}
		
		public function persistCredentials ():void
		{
			_so.data.credentials = {username:_username, password:_password};
			_so.flush ();
			
		}
		public function clearCredentials ():void
		{
			delete _so.data.credentials;
			_so.flush ();
		}
		
		public function loadCredentials ():Object
		{
			if (_so.data.credentials)
			{
				setCredentials(_so.data.credentials.username, _so.data.credentials.password);
				return getCredentials ();
			}
			return null;
		}
	/**
		Gets the list of subscriptions from requested-bloglines account. 
	
		@method listSubs (public)
		@usage <code>bloglinesService.listSubs();</code>
		@param None
		@return Void
		@example
		@see BloglinesResultEvent#ON_LIST_SUBS_RESULT
	
		*/
		public function listSubs():Object
		{
	
			//trace("BloglinesService::listSubs()");
			var loader:HTTPURLLoader = new HTTPURLLoader();
			loader.addEventListener("complete", onListSubsResult);
			loader.addEventListener("progress", function (evt) { trace(evt.bytesLoaded);});
			loader.addEventListener("httpStatus", onHTTPStatus);
						
			var request:URLRequest = new URLRequest();
			request.url = END_POINT + "listsubs";	
			request.requestHeaders.push(new URLRequestHeader("Authorization", "Basic " + _credentials));
			loader.targetEvent = 	BloglinesResultEvent.ON_LIST_SUBS_RESULT;
			loader.load(request);
			
			return _so.data.subs [_username];
		}
	
		/**
		Gets the items from a subscription.
	
		@method getItems (public)
		@usage <code>bloglinesService.getItems(bloglinesSubsId, markRead, date);</code>
		@param bloglinesSubsId id of bloglines-subscription - required
		@param markRead	param specifies if items are marked read, items are not marked read by default - option param.
		@param date 

		@return Void
		@example
		@see BloglinesResultEvent#ON_LIST_SUBS_RESULT
	
		*/
		public function getItems(bloglinesSubsId:uint, markRead:int=-1, date:int=-1):void
		{
			var loader:HTTPURLLoader = new HTTPURLLoader();
			loader.addEventListener("complete", onGetItemsResult);
			loader.addEventListener("httpStatus", onHTTPStatus);
		
			var params:String = "s=" + bloglinesSubsId;
			
			params+= markRead != -1 ? ("&n="+ markRead) : "";
			params+= date != -1 ? ("&d=" + date) : "";

			var request:URLRequest = new URLRequest();
			request.url = encodeURI(END_POINT + "getitems?"+params);
		
			request.requestHeaders.push(new URLRequestHeader("Authorization", "Basic " + _credentials));
			loader.targetEvent = 	BloglinesResultEvent.ON_GET_ITEMS_RESULT;
			loader.bloglinesSubsId = bloglinesSubsId;
			loader.markRead	= markRead;
			loader.date = date;
			loader.load(request);
		}

	/*__________________________________________________________________________________________________________________

		Private Methods
		__________________________________________________________________________________________________________________
	*/

		private function onListSubsResult(event:Event):void
		{
			if (loginSuccess)
			{
				//trace("BloglinesService::onListSubsResult");
				var evt:BloglinesListSubsResultEvent = new BloglinesListSubsResultEvent();
				_opmlData = BloglinesParser.getInstance ().parse(HTTPURLLoader(event.target).data);
				evt.data = _opmlData;
				evt.rawData = (HTTPURLLoader(event.target).data);
				evt.success = true;
				if (!_so.data.subs)
				{
					_so.data.subs = {};
					
				}
				_so.data.subs [_username] = evt.rawData;
				trace ("Bloglines Data: " + evt.rawData);
				trace("BloglinesService::onListSubsResult() - " + _opmlData.subscriptions.length);	
				dispatchEvent(evt);	
			}
			
		}

		private function onGetItemsResult(event:Event):void
		{
			if (loginSuccess)
			{
				var evt:BloglinesGetItemsResultEvent = new BloglinesGetItemsResultEvent();
				evt.data = new XML(HTTPURLLoader(event.target).data);
				evt.success = true;
				trace ("BloglinesService::onGetItemsResult ()");
				dispatchEvent(evt);
			}
		}

		private function onHTTPStatus(event:HTTPStatusEvent):void
		{
			var type:String = BloglinesFaultEvent.ERROR;//event.target.targetEvent;
			
			trace ("BloglinesService::onHTTPStatus () " +  event.status);
			switch(event.status)
			{
				case 200: //normal
					loginSuccess = true;
					break;
				case 304: //request produced no entries (no unread entry or no entries after given date)
						
					break;
				case 401: //incorrect email or password
					//trace("BloglinesService::onHTTPStatus() " + type);
					type = BloglinesFaultEvent.LOGIN_ERROR;
					loginSuccess = false;
					dispatchErrorEvent (type, "Incorrect email or password", event.status);	
					break;
				case 403: //invalid or missing BloglinesSubId
					dispatchErrorEvent (type, "invalid or missing BloglinesSubId", event.status);
					break;
				case 410: //subscription has been deleted
					dispatchErrorEvent (type, "subscription has been deleted", event.status);
					break;
				default:
			}
			
		}
		
		private function dispatchErrorEvent (type:String, error:String, errorCode:int):void
		{
			var evt:BloglinesFaultEvent = new BloglinesFaultEvent(type);
			evt.message = error;
			evt.errorCode = errorCode;
			dispatchEvent(evt);
		} 
		
	
	}
}

