package com.zenbullets.draw3dDemos
{
	import com.sebleedelisle.draw3d.Graphics3D;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	public class DrawCanvas extends Sprite {
		
		protected var _BITMAP_ON:Boolean = false;
		protected var _CLEAR_BITMAP_EVERY_FRAME:Boolean = false
		protected var _GLOW_ON:Boolean = false;
		
		protected var _width:Number;
		protected var _height:Number;
		
		// 2D canvas
		protected var _bmd:BitmapData;
		protected var _bm:Bitmap;
		protected var _bf:BlurFilter;
		protected var _gf:GlowFilter;
		protected var _cmf:ColorMatrixFilter;
		
		// 3D
		protected var _g3d:Graphics3D;
		protected var _g3DHolder:Sprite;
		
		//======================================================================== init / debug
		
		public function DrawCanvas(wid:Number, hei:Number) {
			super();
			_width = wid;
			_height = hei;
			
			// init the 2D bitmap canvas
			if (_BITMAP_ON) {
				newBitmap();
				if (_GLOW_ON) {
					_bf = new BlurFilter(16, 16, 2);
					_gf = new GlowFilter(0xffffff, 0.7, 6.0, 6.0, 2, 2);
					_cmf = new ColorMatrixFilter([1.05,0,0,0,0,
						0,1.05,0,0,0,
						0,0,1.05,0,0,
						0,0,0,.54,0]);
				}
			}
			
			// init the 3D
			_g3DHolder = new Sprite();
			_g3d = new Graphics3D(this, _width, _height);
			_g3DHolder.addChild(_g3d);
			addChild(_g3DHolder);
			
			addEventListener(Event.ENTER_FRAME, frameScript);
		}
		
		protected function newBitmap():void {
			_bmd = new BitmapData(_width, _height, true, 0xcccccc);
			_bm = new Bitmap(_bmd);
			addChild(_bm);
		}
		
		protected function trrace(str:Object):void {
			trace("DrawCanvas " + str.toString());
		}
		
		//======================================================================== frame
		
		// example frame script (for overriding)
		protected function frameScript(e:Event):void {
			newFrame();
			// draw using _g3d here
			render();
			
			trrace("WARNING: default frameScript function has not neen overridden"); 
		}
		
		protected function newFrame():void {
			if (_BITMAP_ON) {
				if (_CLEAR_BITMAP_EVERY_FRAME) { 
					if (this.contains(_bm)) { this.removeChild(_bm); }
					newBitmap(); 
				}
				_g3d.clearCanvas();
			}
		}
		
		protected function render():void {
			if (_BITMAP_ON) {
				if ((!_CLEAR_BITMAP_EVERY_FRAME) && (_GLOW_ON)) {
					_bmd.applyFilter(_bmd, _bmd.rect, new Point(0, 0), _cmf);
					_bmd.applyFilter(_bmd, _bmd.rect, new Point(0, 0), _bf);
				}
				_bmd.draw(this);
				if ((_CLEAR_BITMAP_EVERY_FRAME) && (_GLOW_ON)) {
					_bmd.applyFilter(_bmd, _bmd.rect, new Point(0, 0), _gf);
					_bmd.applyFilter(_bmd, _bmd.rect, new Point(0, 0), _bf);
				}
			}
		}
		
		
	}
}