package com.zenbullets.draw3dDemos.grain
{
	import com.sebleedelisle.draw3d.Point3D;
	import com.zenbullets.utils.ZBMath;
	
	import flash.geom.Vector3D;
	
	public class GrainObj {
		
		private var _app:GrainDemo;
		
		public var locV:Point3D, lastLocV:Point3D;
		private var speedV:Point3D;
		private var speedcap:Number;
		
		public var col:Number;
		
		private var nextTarget:int;
		private var timeToTargetSwap:int;
		
		public function GrainObj(app:GrainDemo) {
			_app = app;
			
			// locV = _app.randPoint();			
			locV = new Point3D(0, 0, 0);
			lastLocV = locV;
			speedV = new Point3D(0, 0, 0);
			speedcap = int(2 + (Math.random() * 16));
			
			col = ZBMath.interpolateColor(0x392133, 0xFFECBE, Math.random())
			
			nextTarget = int(Math.random() * _app._numtargets);
			timeToTargetSwap = 10;
		}
		
		public function updateMe():void {
			
			var targetV:Point3D = _app._targets[nextTarget];
			var dirV:Point3D = Point3D.sub(targetV, locV);
			dirV = Point3D.normalise(dirV);
			speedV = Point3D.add(speedV, dirV);
			speedV = Point3D.limit(speedV, speedcap);
			
			lastLocV = locV.clone();
			locV = Point3D.add(locV, speedV);
			
			timeToTargetSwap--;
			// if (dist(targetV.x, targetV.y, locV.x, locV.y) < (5 + random(20))) {
			if (timeToTargetSwap == 0) {
				nextTarget++;
				if (nextTarget == _app._numtargets) { nextTarget = 0; }
				timeToTargetSwap = 20;
			}
		}
	}
}