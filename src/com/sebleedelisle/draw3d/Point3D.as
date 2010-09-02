package com.sebleedelisle.draw3d 
{
	
	/**
	 * @author Seb Lee-Delisle
	 */
	public class Point3D 
	{
		
		public static var fov : Number = 450; 
		public static var DEG_TO_RAD : Number = Math.PI/180; 
		
		protected var _x : Number ; 
		protected var _y : Number ; 
		protected var _z : Number ; 
		
		public var x2d : Number; 
		public var y2d : Number; 
		public var scale2d : Number ; 
		
		public function Point3D(x : Number, y : Number, z : Number) 
		{
			this._x = x; 
			this._y = y; 
			this._z = z; 
			update();
		}
		
		public function update() : void 
		{
			// TODO Add dirty flag
			
			scale2d = fov/(fov+_z); 
			x2d = _x * scale2d; 
			y2d = _y * scale2d; 
			
		}
		
		public function rotateX(angle:Number) :void
		{
			var cosRY:Number = Math.cos(angle * DEG_TO_RAD);
			var sinRY:Number = Math.sin(angle * DEG_TO_RAD);
			var temp:Point3D;
			
			temp = new Point3D(_x,_y,_z); 
			
			//	//trace("rotate x temp ="+temp);
			
			_y = (temp.y*cosRY)-(temp.z*sinRY);
			_z = (temp.y*sinRY)+(temp.z*cosRY);
			//trace("rotated x ="+this);
			
		}	
		
		public function rotateY(angle:Number) :void
		{
			var cosRY:Number = Math.cos(angle * DEG_TO_RAD);
			var sinRY:Number = Math.sin(angle * DEG_TO_RAD);
			var temp:Point3D;
			
			temp = new Point3D(_x,_y,_z); 
			
			
			_x= (temp.x*cosRY)+(temp.z*sinRY);
			_z= (temp.x*-sinRY)+(temp.z*cosRY);
			
			
		}	
		public function rotateZ(angle:Number) :void
		{
			var cosRY:Number = Math.cos(angle * DEG_TO_RAD);
			var sinRY:Number = Math.sin(angle * DEG_TO_RAD);
			var temp:Point3D;
			
			temp = new Point3D(_x,_y,_z); 
			
			
			//this.x= temp.x;
			_x= (temp.x*cosRY)-(temp.y*sinRY);
			_y= (temp.x*sinRY)+(temp.y*cosRY);
		}	
		
		
		public function get x () : Number { return _x; }; 
		public function get y () : Number { return _y; }; 
		public function get z () : Number { return _z; }; 
		
		public function set x (value:Number) : void { _x = value; update(); }; 
		public function set y (value:Number) : void { _y = value; update(); }; 
		public function set z (value:Number) : void { _z = value; update(); }; 
		
		public function clone():Point3D {
			return new Point3D(x, y, z);
		}
		
		//============== vector utils
		
		public static function sub(p1:Point3D, p2:Point3D):Point3D {
			var newPoint:Point3D = p1.clone();
			newPoint.x -= p2.x;
			newPoint.y -= p2.y;
			newPoint.z -= p2.z;
			return newPoint;
		}
		
		public static function add(p1:Point3D, p2:Point3D):Point3D {
			var newPoint:Point3D = p1.clone();
			newPoint.x += p2.x;
			newPoint.y += p2.y;
			newPoint.z += p2.z;
			return newPoint;
		}
		
		public static function normalise(p1:Point3D):Point3D {
			var newPoint:Point3D = p1.clone();
			var dist:Number = Math.sqrt( (newPoint.x * newPoint.x)+(newPoint.y * newPoint.y)+(newPoint.z * newPoint.z) );
			newPoint.x = newPoint.x * ( 1.0 / dist );
			newPoint.y = newPoint.y * ( 1.0 / dist );
			newPoint.z = newPoint.z * ( 1.0 / dist );
			return newPoint;
		}
		
		public static function limit(p1:Point3D, num:Number):Point3D {
			var newPoint:Point3D = p1.clone();
			if (newPoint.x > num) { newPoint.x = num; }
			if (newPoint.y > num) { newPoint.y = num; }
			if (newPoint.z > num) { newPoint.x = num; }
			if (newPoint.x < -num) { newPoint.x = -num; }
			if (newPoint.y < -num) { newPoint.y = -num; }
			if (newPoint.z < -num) { newPoint.z = -num; }
			return newPoint;
		}
		
		
		
	}
}
