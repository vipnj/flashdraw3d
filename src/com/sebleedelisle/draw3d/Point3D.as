package com.sebleedelisle.draw3d 
{

	/**
	 * @author Seb Lee-Delisle
	 */
	public class Point3D 
	{
		
		public static var fov : Number = 250; 
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
		
		
	}
}
