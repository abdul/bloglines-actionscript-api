/*
	Adobe Systems Incorporated(r) Source Code License Agreement
	Copyright(c) 2005 Adobe Systems Incorporated. All rights reserved.
	
	Please read this Source Code License Agreement carefully before using
	the source code.
	
	Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive, 
	no-charge, royalty-free, irrevocable copyright license, to reproduce,
	prepare derivative works of, publicly display, publicly perform, and
	distribute this source code and such derivative works in source or 
	object code form without any attribution requirements.  
	
	The name "Adobe Systems Incorporated" must not be used to endorse or promote products
	derived from the source code without prior written permission.
	
	You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
	against any loss, damage, claims or lawsuits, including attorney's 
	fees that arise or result from your use or distribution of the source 
	code.
	
	THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT 
	ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
	BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  ALSO, THERE IS NO WARRANTY OF 
	NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT.  IN NO EVENT SHALL MACROMEDIA
	OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
	PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
	OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
	WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
	OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.macromedia.utils.date.tests
{
	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	
	import com.macromedia.utils.date.DateUtils;
	import com.macromedia.utils.array.ArrayUtils;

	import flash.util.StringBuilder;

	public class DateUtilsTest extends TestCase
	{	
		
		private var SHORT_MONTH:Array = ["Jan", "Feb", "Mar", "Apr",  "May", "Jun",
											  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];		
		
		private var FULL_MONTH:Array = ["January", "February", "March", "April",  "May",
											 "June", "July", "August", "September", 
											 "October", "November", "December"];
	
		private var SHORT_DAY:Array = ["Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat"];
			
		private var FULL_DAY:Array = ["Sunday", "Monday", "Tuesday", "Wednsday",
		                                    "Thursday", "Friday", "Saturday"];		
		
	    public function DateUtilsTest(methodName:String)
        {
            super(methodName);
            
        }
        
		public static function suite():TestSuite
		{
			var ts:TestSuite = new TestSuite();
			
				ts.addTest(Test(new DateUtilsTest("testSHORT_MONTH")));
				ts.addTest(Test(new DateUtilsTest("testFULL_MONTH")));
				ts.addTest(Test(new DateUtilsTest("testSHORT_DAY")));
				ts.addTest(Test(new DateUtilsTest("testFULL_DAY")));
				ts.addTest(Test(new DateUtilsTest("testGetShortMonthName")));
				ts.addTest(Test(new DateUtilsTest("testGetShortDayName")));
				ts.addTest(Test(new DateUtilsTest("testGetShortMonthIndex")));
				ts.addTest(Test(new DateUtilsTest("testGetShortDayIndex")));
				ts.addTest(Test(new DateUtilsTest("testGetFullMonthName")));
				ts.addTest(Test(new DateUtilsTest("testGetFullDayName")));
				ts.addTest(Test(new DateUtilsTest("testGetFullMonthIndex")));
				ts.addTest(Test(new DateUtilsTest("testGetFullDayIndex")));		
				ts.addTest(Test(new DateUtilsTest("testGetShortYear")));		
				ts.addTest(Test(new DateUtilsTest("testCompareDates")));
				ts.addTest(Test(new DateUtilsTest("testParseRFC822")));
				ts.addTest(Test(new DateUtilsTest("testGetShortHours")));
				ts.addTest(Test(new DateUtilsTest("testGetAMPM")));
				ts.addTest(Test(new DateUtilsTest("testToRFC822")));
				ts.addTest(Test(new DateUtilsTest("testRFC822")));
				ts.addTest(Test(new DateUtilsTest("testW3CDTF")));
				ts.addTest(Test(new DateUtilsTest("testParseW3CDTF")));
				ts.addTest(Test(new DateUtilsTest("testToW3CDTF")));
				
			return ts;
		}
		
		public function testToW3CDTF():void
		{
			var s:String = "1994-11-05T08:15:30-08:00";
			var d:Date = DateUtils.parseW3CDTF(s);
			assertTrue(s + " == 1994-11-05T16:15:30-00:00",
					   DateUtils.toW3CDTF(d) == "1994-11-05T16:15:30-00:00");
		}
		
		public function testParseW3CDTF():void
		{
			//1994-11-05T08:15:30-05:00 corresponds to November 5, 1994, 8:15:30
			// am, US Eastern Standard Time.
			
			var s:String = "1994-11-05T08:15:30-08:00";
			
			var d:Date = DateUtils.parseW3CDTF(s);
			
			assertNotNull("d is null", d);
			assertTrue("d.date == 5",d.date == 5);
			assertTrue("d.month == 10", d.month == 10);  // 10 is November
			assertTrue("d.fullYear == 1994", d.fullYear == 1994);
			assertTrue("d.hours == 8", d.hours == 8);
			assertTrue("d.minutes == 15", d.minutes == 15);
			assertTrue("d.seconds == 30", d.seconds == 30);
			assertTrue("d.timezoneOffset/60 == 8", d.timezoneOffset/60 == 8);
		}
		
		public function testW3CDTF():void
		{
			var d1:Date = new Date();
			
			d1.setMilliseconds(0);
			
			var s:String = DateUtils.toW3CDTF(d1);
			
			var d2:Date = DateUtils.parseW3CDTF(s);
			
			assertTrue("DateUtils.compareDates(d1, d2) == 0",
											DateUtils.compareDates(d1, d2) == 0);
		}		
		
		public function testRFC822():void
		{
			var d1:Date = new Date();
			
			d1.setMilliseconds(0);
			
			var s:String = DateUtils.toRFC822(d1);
			
			var d2:Date = DateUtils.parseRFC822(s);
			
			assertTrue("DateUtils.compareDates(d1, d2) == 0",
											DateUtils.compareDates(d1, d2) == 0);
		}
		
		public function testToRFC822():void
		{
			// "Mon, 05 Dec 2005 14:55:43 -0800";
			
			var d:Date = new Date(Date.UTC(2005,0,1,1,1,1,0));
			
			assertTrue("DateUtils.toRFC822(d) == \"Sat, 01 Jan 2005 01:01:01 GMT\"",
					DateUtils.toRFC822(d) == "Sat, 01 Jan 2005 01:01:01 GMT");
		}
		
		public function testGetAMPM():void
		{
			var d:Date = new Date(2005,1,1);
			
			d.hours = 7;
			assertTrue("DateUtils.getAMPM(d) == \"AM\"",
												DateUtils.getAMPM(d) == "AM");
												
			d.hours = 23;
			assertTrue("DateUtils.getAMPM(d) == \"PM\"",
												DateUtils.getAMPM(d) == "PM");
												
			d.hours = 12;
			assertTrue("DateUtils.getAMPM(d) == \"PM\"",
												DateUtils.getAMPM(d) == "PM");
												
			d.hours = 11;
			assertTrue("DateUtils.getAMPM(d) == \"AM\"",
												DateUtils.getAMPM(d) == "AM");
																																			
			d.hours = 0;
			assertTrue("DateUtils.getAMPM(d) == \"AM\"",
												DateUtils.getAMPM(d) == "AM");		
												
			d.hours = 13;
			assertTrue("DateUtils.getAMPM(d) == \"PM\"",
												DateUtils.getAMPM(d) == "PM");
		}
		
		public function testGetShortHours():void
		{
			var d:Date = new Date(2005,1,1);
			
			d.hours = 7;
			assertTrue("DateUtils.getShortHour(d) == 7",
												DateUtils.getShortHour(d) == 7);
												
			d.hours = 23;
			assertTrue("DateUtils.getShortHour(d) == 11",
												DateUtils.getShortHour(d) == 11);
												
			d.hours = 12;
			assertTrue("DateUtils.getShortHour(d) == 12",
												DateUtils.getShortHour(d) == 12);
																																			
			d.hours = 0;
			assertTrue("DateUtils.getShortHour(d) == 12",
												DateUtils.getShortHour(d) == 12);		
												
			d.hours = 13;
			assertTrue("DateUtils.getShortHour(d) == 1",
												DateUtils.getShortHour(d) == 1);																				
		}
		
		public function testParseRFC822():void
		{
			var s:String = "Mon, 05 Dec 2005 14:55:43 -0800";
			
			var d:Date = DateUtils.parseRFC822(s);
			
			assertNotNull("d is null", d);
			assertTrue("d.date == 5",d.date == 5);
			assertTrue("d.month == 11", d.month == 11);
			assertTrue("d.fullYear == 2005", d.fullYear == 2005);
			assertTrue("d.hours == 14", d.hours == 14);
			assertTrue("d.minutes == 55", d.minutes == 55);
			assertTrue("d.seconds == 43", d.seconds == 43);
			
			var exception:Boolean = false;
			try
			{
				DateUtils.parseRFC822("foo");
			}
			catch(e:Error)
			{
				exception = true;
			}
			
			if(!exception)
			{
				assertTrue("DateUtils.parseRFC822(\"foo\") did not throw an exception.", false);
			}
		}
		
		
		public function testCompareDates():void
		{
			var d1:Date = new Date(2005,0,1,1,1,1,1);
			var d2:Date = new Date(2006,0,1,1,1,1,1);
			var d4:Date = new Date(2005,0,1,1,1,1,1);
			
			assertTrue("DateUtils.compareDates(d1, d2) == 1",
										DateUtils.compareDates(d1, d2) == 1);
										
			assertTrue("DateUtils.compareDates(d2, d1) == -1",
										DateUtils.compareDates(d2, d1) == -1);
										
			assertTrue("DateUtils.compareDates(d1, d1) == 0",
										DateUtils.compareDates(d1, d1) == 0);
										
			assertTrue("DateUtils.compareDates(d1, d4) == 0",
										DateUtils.compareDates(d1, d4) == 0);
		}
		
		public function testGetShortYear():void
		{
			var d:Date = new Date(2005);
			
			d.fullYear = 2005;
			assertTrue("DateUtils.getShortYear(d) == \"05\"",
								DateUtils.getShortYear(d) == "05");
								
			d.fullYear = 2000;
			assertTrue("DateUtils.getShortYear(d) == \"00\"",
								DateUtils.getShortYear(d) == "00");
								
			d.fullYear = 1900;
			assertTrue("DateUtils.getShortYear(d) == \"00\"",
								DateUtils.getShortYear(d) == "00");
								
			d.fullYear = 21501;
			assertTrue("DateUtils.getShortYear(d) == \"01\"",
								DateUtils.getShortYear(d) == "01");
								
			d.fullYear = 10;
			assertTrue("DateUtils.getShortYear(d) == \"10\"",
								DateUtils.getShortYear(d) == "10");
								
			d.fullYear = 7;
			assertTrue("DateUtils.getShortYear(d) == \"7\"",
								DateUtils.getShortYear(d) == "7");
		}
		
		public function testGetFullDayIndex():void
		{
			var len:int = FULL_DAY.length;
			
			for(var i:int = 0; i < len; i++)
			{
				assertTrue("DateUtils.getFullDayIndex(FULL_DAY["+i+"]) == i",
								DateUtils.getFullDayIndex(FULL_DAY[i]) == i);
			}
		}		
		
		public function testGetFullMonthIndex():void
		{
			var len:int = FULL_MONTH.length;
			
			for(var i:int = 0; i < len; i++)
			{
				assertTrue("DateUtils.getFullMonthIndex(FULL_MONTH["+i+"]) == i",
								DateUtils.getFullMonthIndex(FULL_MONTH[i]) == i);
			}
		}
		
		public function testGetFullDayName():void
		{
			var d:Date;
			
			var len:uint = FULL_DAY.length;
			
			for(var i:uint = 0; i < len; i++)
			{
				//12-04-2005 is a sunday
				d = new Date(2005,11, i + 4);
				
				assertTrue("DateUtils.getFullDayName(d) == FULL_DAY["+i+"]",
								DateUtils.getFullDayName(d) == FULL_DAY[i]);
			}
		}		
		
		public function testGetFullMonthName():void
		{
			var d:Date;
			
			var len:uint = FULL_MONTH.length;
			
			for(var i:uint = 0; i < len; i++)
			{
				d = new Date(2005,i);
				
				assertTrue("DateUtils.getFullMonthName(d) == FULL_MONTH["+i+"]",
								DateUtils.getFullMonthName(d) == FULL_MONTH[i]);
			}
		}		
		
		public function testGetShortDayIndex():void
		{
			var len:int = SHORT_DAY.length;
			
			for(var i:int = 0; i < len; i++)
			{
				assertTrue("DateUtils.getShortDayIndex(SHORT_DAY["+i+"]) == i",
								DateUtils.getShortDayIndex(SHORT_DAY[i]) == i);
			}
		}		
		
		public function testGetShortMonthIndex():void
		{
			var len:int = SHORT_MONTH.length;
			
			for(var i:int = 0; i < len; i++)
			{
				assertTrue("DateUtils.getShortMonthIndex(SHORT_MONTH["+i+"]) == i",
								DateUtils.getShortMonthIndex(SHORT_MONTH[i]) == i);
			}
		}
		
		public function testGetShortDayName():void
		{
			var d:Date;
			
			var len:uint = SHORT_DAY.length;
			
			for(var i:uint = 0; i < len; i++)
			{
				//12-04-2005 is a sunday
				d = new Date(2005,11, i + 4);
				
				assertTrue("DateUtils.getShortDayName(d) == SHORT_DAY["+i+"]",
								DateUtils.getShortDayName(d) == SHORT_DAY[i]);
			}
		}		
		
		public function testGetShortMonthName():void
		{
			var d:Date;
			
			var len:uint = SHORT_MONTH.length;
			
			for(var i:uint = 0; i < len; i++)
			{
				d = new Date(2005,i);
				
				assertTrue("DateUtils.getShortMonthName(d) == SHORT_MONTH["+i+"]",
								DateUtils.getShortMonthName(d) == SHORT_MONTH[i]);
			}
		}
		
		public function testSHORT_MONTH():void
		{
			assertTrue("ArrayUtils.arraysAreEqual(DateUtils.SHORT_MONTH, SHORT_MONTH)",
					ArrayUtils.arraysAreEqual(DateUtils.SHORT_MONTH, SHORT_MONTH));
		}

		public function testFULL_MONTH():void
		{
			assertTrue("ArrayUtils.arraysAreEqual(DateUtils.FULL_MONTH, FULL_MONTH)",
					ArrayUtils.arraysAreEqual(DateUtils.FULL_MONTH, FULL_MONTH));
		}

		public function testFULL_DAY():void
		{
			assertTrue("ArrayUtils.arraysAreEqual(DateUtils.FULL_DAY, FULL_DAY)",
					ArrayUtils.arraysAreEqual(DateUtils.FULL_DAY, FULL_DAY));
		}
		
		public function testSHORT_DAY():void
		{
			assertTrue("ArrayUtils.arraysAreEqual(DateUtils.SHORT_DAY, SHORT_DAY)",
					ArrayUtils.arraysAreEqual(DateUtils.SHORT_DAY, SHORT_DAY));
		}
	}
}