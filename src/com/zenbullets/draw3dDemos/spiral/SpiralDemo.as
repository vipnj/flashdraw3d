package com.zenbullets.draw3dDemos.spiral
{
	import com.zenbullets.utils.ZBMath;
	
	import flash.events.Event;
	import flash.geom.Point;
	
	import nl.ronvalstar.math.OptimisedPerlin;
	import com.zenbullets.draw3dDemos.DrawCanvas;
	
	public class SpiralDemo extends DrawCanvas
	{
		
		private var _radNoiseSeed:Number;
		
		private var _rotationX:Number = 0;
		private var _rotationY:Number = 0;
		private var _rotationZ:Number = 0;
		
		private var _rotXnoise:Number;
		private var _rotYnoise:Number;
		private var _rotZnoise:Number;
		
		//======================================================================== init / debug
		
		public function SpiralDemo(wid:Number, hei:Number) {
			_BITMAP_ON = true;
			// _CLEAR_BITMAP_EVERY_FRAME = true;
			_GLOW_ON = true;
			super(wid, hei);
			
			_g3d.lineStyle(1, 0xffffff, 1); 
			
			_rotXnoise = Math.random() * 10;
			_rotYnoise = Math.random() * 10;
			_rotZnoise = Math.random() * 10;
			_radNoiseSeed = 125;
		}
		
		protected override function trrace(str:Object):void {
			trace("SpiralDemo " + str.toString());
		}
		
		//======================================================================== frame
		
		protected override function frameScript(e:Event):void {
			newFrame();
			// _g3d.clearCanvas();
			
			drawSphere();
			
			_rotXnoise += 0.01;
			_rotYnoise += 0.01;
			_rotZnoise += 0.01;
			_rotationX += OptimisedPerlin.noise(_rotXnoise) * 2;
			_rotationY += OptimisedPerlin.noise(_rotYnoise) * 2;
			_rotationZ += OptimisedPerlin.noise(_rotZnoise) * 2;
			_g3d.rotateX(_rotationX);
			_g3d.rotateY(_rotationY);
			_g3d.rotateZ(_rotationZ);
			
			render();
		}
		
		//======================================================================== sphere drawing
		
		private function drawSphere():void {
			_radNoiseSeed += 0.1;
			var radNoise:Number = _radNoiseSeed;
			
			var baseRad:Number = 100;
			
			var s:Number = 0;
			var t:Number = 0;
			var lastx:Number = 0; 
			var lasty:Number = 0;
			var lastz:Number = 0;
			while (t < 180) { 
				s += 18;  
				t += 0.25;  
				var radianS:Number = ZBMath.radians(s);
				var radianT:Number = ZBMath.radians(t);
				
				radNoise += 0.1;
				var radius:Number = baseRad + (OptimisedPerlin.noise(radNoise) * 100);
				
				var thisx:Number = 0 + (radius * Math.cos(radianS) * Math.sin(radianT));
				var thisy:Number = 0 + (radius * Math.sin(radianS) * Math.sin(radianT));
				var thisz:Number = 0 + (radius * Math.cos(radianT));
				
				if (lastx != 0) {
					_g3d.lineTo(thisx, thisy, thisz); 
				} else {
					_g3d.moveTo(thisx, thisy, thisz);
				}
				lastx = thisx; 
				lasty = thisy; 
				lastz = thisz;
			}
		}
		
	}
}