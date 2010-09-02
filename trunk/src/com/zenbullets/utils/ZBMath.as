
/**
 * zenbullets utils - ZBMath
 * 
 * a few maths helper funcs, 
 * some of which may have been stolen from various places on the internet
 * 
 * http://www.actionscripter.co.uk
 * http://www.zenbullets.com
 * 
 * matt@actionscripter.co.uk
 */


package com.zenbullets.utils
{
	public class ZBMath {
		
		//======================================================================== init / debug
		
		public function ZBMath() {
		}
		
		private static function trrace(str:Object):void {
			trace("ZBMath " + str.toString());
		}
		
		//======================================================================== 
		
		public static function radians(degrees:Number):Number {
			return degrees * Math.PI / 180;
		}
		
		public static function degrees(radians:Number):Number {
			return radians * 180 / Math.PI;
		}
		
		public static function randRange(min:Number, max:Number):Number {
			return (Math.random()*(max-min))+min;
		}
		
		public static function getNumberAsHexString(num:uint, minLength:uint = 1, 
													showHexDenotation:Boolean = true):String {
			var str:String = num.toString(16).toUpperCase();
			while (minLength > str.length) {
				str = "0" + str;
			}
			if (showHexDenotation) { str = "0x" + str; }
			return str;
		}
		
		public static function dist(x1:Number = 0, y1:Number = 0, z1:Number = 0, 
									x2:Number = 0, y2:Number = 0, z2:Number = 0):Number {
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			var dz:Number = z2 - z1;
			return Math.sqrt(dx*dx + dy*dy + dz*dz);
		}
		
		public static function interpolateColor(fromColor:uint, toColor:uint, progress:Number):uint {         
			var q:Number = 1-progress;         
			var fromA:uint = (fromColor >> 24) & 0xFF;         
			var fromR:uint = (fromColor >> 16) & 0xFF;         
			var fromG:uint = (fromColor >>  8) & 0xFF;         
			var fromB:uint =  fromColor        & 0xFF;         
			var toA:uint = (toColor >> 24) & 0xFF;         
			var toR:uint = (toColor >> 16) & 0xFF;         
			var toG:uint = (toColor >>  8) & 0xFF;         
			var toB:uint =  toColor        & 0xFF;                 
			var resultA:uint = fromA*q + toA*progress;         
			var resultR:uint = fromR*q + toR*progress;         
			var resultG:uint = fromG*q + toG*progress;         
			var resultB:uint = fromB*q + toB*progress;         
			var resultColor:uint = resultA << 24 | resultR << 16 | resultG << 8 | resultB;         
			return resultColor;      
		}
		
		
		
	}
}