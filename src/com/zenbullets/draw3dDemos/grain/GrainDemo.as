package com.zenbullets.draw3dDemos.grain
{
	import com.sebleedelisle.draw3d.Graphics3D;
	import com.sebleedelisle.draw3d.Point3D;
	import com.zenbullets.draw3dDemos.DrawCanvas;
	import com.zenbullets.utils.ZBMath;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	
	public class GrainDemo extends DrawCanvas {
		
		private var _frameCounter:int = 0;
		
		private var _numsources:int = 100;
		public var _numtargets:int = 8;
		private var _grains:Array;		// array of GrainObjs
		public var _targets:Array;		// array of 
		
		// view
		private var _autoRotate:Boolean = false;
		private var _xView:Number, _yView:Number, _zView:Number;
		private var _xRotate:Number, _yRotate:Number, _zRotate:Number;
		
		
		//======================================================================== init / debug
		
		public function GrainDemo(wid:Number, hei:Number) {
			_BITMAP_ON = true;
			super(wid, hei);
			restart();
		}
		
		protected override function trrace(str:Object):void {
			trace("GrainDemo " + str.toString());
		}
		
		private function restart():void  {
			_g3d.clearCanvas();
			
			// clear bitmap
			if (this.contains(_bm)) { this.removeChild(_bm); }
			newBitmap();
			
			_grains = new Array();
			for (var i:int = 0; i <= _numsources; i++) {
				_grains.push(new GrainObj(this));
			}
			_targets = new Array();
			for (var j:int = 0; j < _numtargets; j++) {
				_targets.push(randPoint());
			}
		}
		
		public function randPoint():Point3D {
			var x:int = int((Math.random() * _width) - (_width/2));
			var y:int = int((Math.random() * _height) - (_height/2));
			var z:int = int(Math.random() * _width);
			var p:Point3D = new Point3D(x, y, z);
			return p;
		}
		
		//======================================================================== frame loop
		
		protected override function frameScript(e:Event):void {
			newFrame();
			_frameCounter++;
			
			for (var i:int = 0; i < _grains.length; i++) {
				var gObj:GrainObj = _grains[i];
				gObj.updateMe();
			}
			for (var j:int = 0; j < _grains.length; j++) {
				var gObj2:GrainObj = _grains[j];
				_g3d.lineStyle(0, gObj2.col, 0.03);  
				_g3d.moveTo(gObj2.lastLocV.x, gObj2.lastLocV.y, gObj2.lastLocV.z);
				_g3d.lineTo(gObj2.locV.x, gObj2.locV.y, gObj2.locV.z);
			}   
			
			if (_frameCounter % 1000 == 0) {
				restart();
			}  
			
			render();
		}
		
		
	}
}