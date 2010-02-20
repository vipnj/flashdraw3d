package  
{
	import com.sebleedelisle.draw3d.Graphics3D;
	import com.sebleedelisle.draw3d.Point3D;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	[SWF (width="550", height="400", frameRate="30", backgroundColor="#000000")]

	/**
	 * @author Seb Lee-Delisle
	 */
	public class RandomLines3D extends Sprite 
	{
		public var g3d : Graphics3D;
		private var isMouseDown : Boolean;
		
		private var pos : Point3D; 

		public function RandomLines3D()
		{
			
			g3d = new Graphics3D(this);
			
			g3d.lineStyle(1, 0xff0000, 1); 
			g3d.moveTo(-10, 0, -10);
			g3d.lineTo(10, 10, 10); 
			
			g3d.drawCube(0, 0, 0, 80, 80, 80);
			
			g3d.drawCube(100, 100, 0, 80, 80, 80);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown); 
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp); 
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}

		public function enterFrame(e : Event) : void
		{
			if(isMouseDown)
			{
				g3d.lineTo2D(mouseX, mouseY, 0);
			}
			
			g3d.rotateY(2);
		}

		public function mouseDown(e : MouseEvent) : void
		{
			isMouseDown = true; 
			g3d.moveTo2D(mouseX, mouseY, 0);
		}

		public function mouseUp(e : MouseEvent) : void
		{
			isMouseDown = false; 
		}
	}
}
