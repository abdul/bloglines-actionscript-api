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

package com.macromedia.utils.string.tests
{
	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	
	import com.macromedia.utils.string.StringUtils;

	public class StringUtilsTest extends TestCase
	{	
	    public function StringUtilsTest(methodName:String)
        {
            super(methodName);
        }
        
		public static function suite():TestSuite
		{
			var ts:TestSuite = new TestSuite();
			
				ts.addTest(Test(new StringUtilsTest("testTrim")));
				ts.addTest(Test(new StringUtilsTest("testRTrim")));
				ts.addTest(Test(new StringUtilsTest("testLTrim")));
				ts.addTest(Test(new StringUtilsTest("testReplace")));
				ts.addTest(Test(new StringUtilsTest("testRemove")));
				
				ts.addTest(Test(new StringUtilsTest("testEndsWith")));
				ts.addTest(Test(new StringUtilsTest("testBeginsWith")));
				ts.addTest(Test(new StringUtilsTest("testStringsAreEqual")));
				
			return ts;
		}

		public function testStringsAreEqual():void
		{
			var s1:String = "a";
			var s2:String = "5";
			var s3:String = new String("a");
			var s4:String = "a";
			var s5:String = "A";
			
			assertTrue("StringUtils.stringsAreEqual(s1, s1, true)",
											StringUtils.stringsAreEqual(s1, s1, true));
				
			assertTrue("StringUtils.stringsAreEqual(s1, \"a\", true)",
											StringUtils.stringsAreEqual(s1, s1, true));
											
			assertTrue("StringUtils.stringsAreEqual(s1, \"A\", true)",
											StringUtils.stringsAreEqual(s1, s1, true));															
											
			assertTrue("!StringUtils.stringsAreEqual(s1, s2, true)",
											!StringUtils.stringsAreEqual(s1, s2, true));
											
			assertTrue("StringUtils.stringsAreEqual(s1, s3, true)",
											StringUtils.stringsAreEqual(s1, s3, true));
											
			assertTrue("StringUtils.stringsAreEqual(s1, s5, false)",
											StringUtils.stringsAreEqual(s1, s5, false));
											
			assertTrue("!StringUtils.stringsAreEqual(s1, s5, true)",
											!StringUtils.stringsAreEqual(s1, s5, true));
											
			assertTrue("StringUtils.stringsAreEqual(s3, s5, false)",
											StringUtils.stringsAreEqual(s1, s5, false));
		}

		public function testEndsWith():void
		{
			assertTrue(
				"StringUtils.endsWith(\"AAAX\", \"X\") == true",
				StringUtils.endsWith("AAAX", "X") == true
				);
				
			assertTrue(
				"StringUtils.endsWith(\"XAAA\", \"O\") == false",
				StringUtils.endsWith("XAAA", "0") == false
				);
				
			assertTrue(
				"StringUtils.endsWith(\"AAXX\", \"XX\") == true",
				StringUtils.endsWith("AAXX", "XX") == true
				);
				
			assertTrue(
				"StringUtils.endsWith(\"AAXXX\", \"XX\") == true",
				StringUtils.endsWith("AAXXX", "XX") == true
				);
				
			assertTrue(
				"StringUtils.endsWith(\"\", \"XX\") == false",
				StringUtils.endsWith("", "XX") == false
				);

			//TODO : Should this return true or false?
			assertTrue(
				"StringUtils.endsWith(\"XX\", \"\") == true",
				StringUtils.endsWith("XX", "") == true
				);
				
			assertTrue(
				"StringUtils.endsWith(\"\", \"\") == true",
				StringUtils.endsWith("", "") == true
				);
		}		
		
		public function testBeginsWith():void
		{
			assertTrue(
				"StringUtils.beginsWith(\"XAAA\", \"X\") == true",
				StringUtils.beginsWith("XAAA", "X") == true
				);
				
			assertTrue(
				"StringUtils.beginsWith(\"XAAA\", \"O\") == false",
				StringUtils.beginsWith("XAAA", "0") == false
				);
				
			assertTrue(
				"StringUtils.beginsWith(\"XXAA\", \"XX\") == true",
				StringUtils.beginsWith("XXAA", "XX") == true
				);
				
			assertTrue(
				"StringUtils.beginsWith(\"XXXAA\", \"XX\") == true",
				StringUtils.beginsWith("XXXAA", "XX") == true
				);
				
			assertTrue(
				"StringUtils.beginsWith(\"\", \"XX\") == false",
				StringUtils.beginsWith("", "XX") == false
				);

			//TODO : Should this return true or false?
			assertTrue(
				"StringUtils.beginsWith(\"XX\", \"\") == true",
				StringUtils.beginsWith("XX", "") == true
				);
				
			assertTrue(
				"StringUtils.beginsWith(\"\", \"\") == true",
				StringUtils.beginsWith("", "") == true
				);
		}
		
		public function testRemove():void
		{
			assertTrue(
				"StringUtils.remove(\"AXXA\", \"X\") == \"AA\"",
				StringUtils.remove("AXXA", "X") == "AA"
				);
				
			assertTrue(
				"StringUtils.remove(\"AXXAXAXXA\", \"X\") == \"AAAA\"",
				StringUtils.remove("AXXAXAXXA", "X") == "AAAA"
				);				
				
			assertTrue(
				"StringUtils.remove(\"AXXXXA\", \"XX\") == \"AA\"",
				StringUtils.remove("AXXXXA", "XX") == "AA"
				);				
				
			assertTrue(
				"StringUtils.remove(\"AXXXA\", \"XX\") == \"AXA\"",
				StringUtils.remove("AXXXA", "XX") == "AXA"
				);
				
			assertTrue(
				"StringUtils.remove(\"AXXXA\", \"-\") == \"AXXXA\"",
				StringUtils.remove("AXXXA", "-") == "AXXXA"
				);
				
			assertTrue(
				"StringUtils.remove(\"X\", \"\") == \"X\"",
				StringUtils.remove("X", "") == "X"
				);
				
			assertTrue(
				"StringUtils.remove(\"\", \"\") == \"\"",
				StringUtils.remove("", "") == ""
				);
		}
		
		public function testReplace():void
		{
			assertTrue(
						"StringUtils.replace(\"AXXA\", \"X\", \"-\") == \"A--A\"",
						StringUtils.replace("AXXA", "X", "-") == "A--A"
						);
						
			assertTrue(
						"StringUtils.replace(\"AXXA\", \"B\", \"-\") == \"AXXA\"",
						StringUtils.replace("AXXA", "B", "-") == "AXXA"
						);	
						
			assertTrue(
						"StringUtils.replace(\"AXXA\", \"XX\", \"-\") == \"A-A\"",
						StringUtils.replace("AXXA", "XX", "-") == "A-A"
						);						
						
			assertTrue(
						"StringUtils.replace(\"AXXA\", \"XX\", \"----\") == \"A----A\"",
						StringUtils.replace("AXXA", "XX", "----") == "A----A"
						);						
						
			assertTrue(
						"StringUtils.replace(\"X\", \"X\", \"-\") == \"-\"",
						StringUtils.replace("X", "X", "-") == "-"
						);
						
			assertTrue(
						"StringUtils.replace(\"AXXA\", \"X\", \"X\") == \"AXXA\"",
						StringUtils.replace("AXXA", "X", "X") == "AXXA"
						);
						
			assertTrue(
						"StringUtils.replace(\"AXXXXA\", \"XXXX\", \"-\") == \"A-A\"",
						StringUtils.replace("AXXXXA", "XXXX", "-") == "A-A"
						);						
						
		}
		
		public function testTrim():void
		{
			assertTrue("StringUtils.trim(\" XXX \") == \"XXX\"",
											StringUtils.trim(" XXX ") == "XXX");
											
			assertTrue("StringUtils.trim(\" \") == \"\"",
											StringUtils.trim(" ") == "");
											
			assertTrue("StringUtils.trim(\"XX\") == \"XX\"",
											StringUtils.trim("XX") == "XX");
											
			assertTrue("StringUtils.trim(\"X\") == \"X\"",
											StringUtils.trim("X") == "X");
											
			assertTrue("StringUtils.trim(\" XX\") == \"XX\"",
											StringUtils.trim(" XX") == "XX");
											
			assertTrue("StringUtils.trim(\"XX \") == \"XX\"",
											StringUtils.trim("XX ") == "XX");
		}
		
		public function testRTrim():void
		{
			assertTrue("StringUtils.rtrim(\" XXX \") == \" XXX\"",
											StringUtils.rtrim(" XXX ") == " XXX");
											
			assertTrue("StringUtils.rtrim(\" \") == \"\"",
											StringUtils.rtrim(" ") == "");
											
			assertTrue("StringUtils.rtrim(\"XX\") == \"XX\"",
											StringUtils.rtrim("XX") == "XX");
											
			assertTrue("StringUtils.rTrim(\"X\") == \"X\"",
											StringUtils.rtrim("X") == "X");
											
			assertTrue("StringUtils.rtrim(\"X \") == \"X\"",
											StringUtils.rtrim("X ") == "X");
											
			assertTrue("StringUtils.rtrim(\" XX\") == \" XX\"",
											StringUtils.rtrim(" XX") == " XX");
											
			assertTrue("StringUtils.rtrim(\"XX \") == \"XX\"",
											StringUtils.rtrim("XX ") == "XX");
		}
		
		public function testLTrim():void
		{
			assertTrue("StringUtils.ltrim(\" XXX \") == \"XXX \"",
											StringUtils.ltrim(" XXX ") == "XXX ");
											
			assertTrue("StringUtils.ltrim(\" \") == \"\"",
											StringUtils.ltrim(" ") == "");
											
			assertTrue("StringUtils.ltrim(\"XX\") == \"XX\"",
											StringUtils.ltrim("XX") == "XX");
											
			assertTrue("StringUtils.rTrim(\"X\") == \"X\"",
											StringUtils.ltrim("X") == "X");
											
			assertTrue("StringUtils.ltrim(\" X\") == \"X\"",
											StringUtils.ltrim(" X") == "X");
											
			assertTrue("StringUtils.ltrim(\"XX \") == \"XX \"",
											StringUtils.ltrim("XX ") == "XX ");
											
			assertTrue("StringUtils.ltrim(\" XX\") == \"XX\"",
											StringUtils.ltrim(" XX") == "XX");
		}
	}
}