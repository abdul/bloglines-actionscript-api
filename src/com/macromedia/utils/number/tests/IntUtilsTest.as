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
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.macromedia.utils.number.tests {

	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	
	import com.macromedia.utils.number.IntUtils;
	
	public class IntUtilsTest extends TestCase {
		
	    public function IntUtilsTest( methodName:String ) {
			super( methodName );
        }
	
		public static function suite():TestSuite {
			var ts:TestSuite = new TestSuite();
			
			ts.addTest( Test( new IntUtilsTest( "testRol" ) ) );
			ts.addTest( Test( new IntUtilsTest( "testToHex" ) ) );
			
			return ts;
		}
		
		public function testRol():void {
			assertTrue( "IntUtils.rol( 0x00000001, 1 )", IntUtils.rol( 0x00000001, 1 ) == 0x00000002 );
			assertTrue( "IntUtils.rol( 0x00000001, 2 )", IntUtils.rol( 0x00000001, 2 ) == 0x00000004 );
			assertTrue( "IntUtils.rol( 0x00000001, 4 )", IntUtils.rol( 0x00000001, 4 ) == 0x00000010 );
			assertTrue( "IntUtils.rol( 0x00000001, 8 )", IntUtils.rol( 0x00000001, 8 ) == 0x00000100 );
			assertTrue( "IntUtils.rol( 0x00000001, 12 )", IntUtils.rol( 0x00000001, 12 ) == 0x00001000 );
			assertTrue( "IntUtils.rol( 0x00000001, 16 )", IntUtils.rol( 0x00000001, 16 ) == 0x00010000 );
			assertTrue( "IntUtils.rol( 0x00000001, 20 )", IntUtils.rol( 0x00000001, 20 ) == 0x00100000 );
			assertTrue( "IntUtils.rol( 0x00000001, 24 )", IntUtils.rol( 0x00000001, 24 ) == 0x01000000 );
			assertTrue( "IntUtils.rol( 0x00000001, 28 )", IntUtils.rol( 0x00000001, 28 ) == 0x10000000 );
			assertTrue( "IntUtils.rol( 0x00000001, 31 )", uint( IntUtils.rol( 0x00000001, 31 ) ) == 0x80000000 );
			assertTrue( "IntUtils.rol( 0x00000001, 32 )", IntUtils.rol( 0x00000001, 32 ) == 0x00000001 );
			
			assertTrue( "IntUtils.rol( 0x80000000, 1 )", IntUtils.rol( int( 0x80000000 ), 1 ) == 0x00000001 );
		}
		
		public function testToHex():void {
			assertTrue( "Little Endian", IntUtils.toHex( 0x12345678 ) == "78563412" );
			assertTrue( "Big Endian", IntUtils.toHex( 0x12345678, true ) == "12345678" );
			
			assertTrue( "Little Endian Negative", IntUtils.toHex( int( 0x89ABCDEF ) ) == "efcdab89" );
			assertTrue( "Big Endian Negative", IntUtils.toHex( int( 0x89ABCDEF ), true ) == "89abcdef" );
		}
	}
}