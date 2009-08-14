package com.sebleedelisle.draw3d 
{

	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Seb Lee-Delisle
	 */
	public class Graphics3D extends Sprite 
	{

		private var points : Array; 
		private var lines : Array; 
		
		private var currentLineStyle : LineStyleData; 
		private var currentPointIndex : int;

		
		public function Graphics3D(target : DisplayObjectContainer)
		{
			target.addChild(this);
			
			// auto centre this - we probably want to change this sometime soon! 
			// TODO make this independent so we can move the container around
			x =  (stage.stageWidth/2);// / stage.scaleX ;
			y =   (stage.stageHeight/2);// / stage.scaleY;
			
			
			this.addEventListener(Event.ENTER_FRAME, enterFrame); 
			
			clear(); 
		}

		public function lineStyle(thickness : Number = 1, colour : int = 0x000000, alpha : Number = 1) : void
		{
			// TODO check to see if it's actually changed before making a new one!
			currentLineStyle = new LineStyleData(thickness, colour, alpha);
		}

		public function moveTo(posx : Number, posy : Number, posz : Number) : void
		{
			currentPointIndex = addPoint(posx, posy, posz);
		}
		
		public function lineTo(posx : Number, posy : Number, posz : Number) : void
		{
			var pointindex : int = addPoint(posx, posy, posz);
			
			lines.push(new Line3D(currentPointIndex, pointindex, currentLineStyle));
			currentPointIndex = pointindex; 
		}

		public function moveTo2D(x2d : Number, y2d : Number, z3d : Number) : void
		{
			currentPointIndex = addPoint2D(x2d, y2d, z3d);
		}

		public function lineTo2D(x2d : Number, y2d : Number, z3d : Number) : void
		{
			
			var pointindex : int = addPoint2D(x2d, y2d, z3d); 
			lines.push(new Line3D(currentPointIndex, pointindex, currentLineStyle));
			currentPointIndex = pointindex; 
			
		}
		
		public function drawCube(xpos : Number, ypos : Number, zpos : Number, width : Number, height : Number, depth : Number) : void
		{
			
			var hw : Number = width*0.5; 
			var hh : Number = height*0.5; 
			var hd : Number = depth*0.5; 
			
			moveTo(xpos - hw, ypos - hh, zpos + hd);
			lineTo(xpos + hw, ypos - hh, zpos + hd);
			lineTo(xpos + hw, ypos - hh, zpos - hd);
			lineTo(xpos - hw, ypos - hh, zpos - hd);
			
			moveTo(xpos + hw, ypos - hh, zpos + hd);
			lineTo(xpos + hw, ypos + hh, zpos + hd);
			lineTo(xpos + hw, ypos + hh, zpos - hd);
			lineTo(xpos + hw, ypos - hh, zpos - hd);
	
			moveTo(xpos + hw, ypos + hh, zpos + hd);
			lineTo(xpos - hw, ypos + hh, zpos + hd);
			lineTo(xpos - hw, ypos + hh, zpos - hd);
			lineTo(xpos + hw, ypos + hh, zpos - hd);

			moveTo(xpos - hw, ypos + hh, zpos + hd);
			lineTo(xpos - hw, ypos - hh, zpos + hd);
			lineTo(xpos - hw, ypos - hh, zpos - hd);
			lineTo(xpos - hw, ypos + hh, zpos - hd);
			
		}
		
		
		public function enterFrame(e : Event) : void
		{
			
			var g : Graphics = graphics; 
			var ls : LineStyleData;
			var p1 : Point3D; 
			var p2 : Point3D; 
			
			
			g.clear(); 

			for each(var point : Point3D in points)
			{
				point.update(); 
			}

			for each (var line : Line3D in lines)
			{
				ls = line.lineStyle; 
				g.lineStyle(ls.thickness, ls.colour, ls.alpha);	
				p1 = points[line.pointIndexStart];
				p2 = points[line.pointIndexEnd];
				g.moveTo(p1.x2d, p1.y2d);
				g.lineTo(p2.x2d, p2.y2d); 
			}
		}

		public function clear() : void
		{
			points = new Array(); 
			addPoint(0, 0, 0);
			lines = new Array(); 
			currentLineStyle = new LineStyleData(); 
			currentPointIndex = 0; 
		}

		private function addPoint(posx : Number, posy : Number, posz : Number) : int
		{
			// TODO add check for whether point already exists
			
			points.push(new Point3D(posx, posy, posz)); 
			return points.length - 1; 
		
		
		
		}
		
		private function addPoint2D(x2d : Number, y2d : Number, z3d : Number) : int
		{
			x2d-=x; 
			y2d-=y; 
			var fov : Number = Point3D.fov; 
			return addPoint(x2d/(fov/(fov + z3d)), y2d/(fov/(fov + z3d)), z3d);
			
		}
		
		
		
		
		public function rotateY(r : Number) : void
		{
			for each(var point : Point3D in points)
			{
				point.rotateY (r); 
				
			}
			
			
			
		}
	}
}
