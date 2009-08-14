package  
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	import com.sebleedelisle.draw3d.Graphics3D;

	import flash.display.Sprite;

	/**
	 * @author Seb Lee-Delisle
	 */
	public class Draw3DTest extends Sprite 
	{
		var g3d : Graphics3D;
		private var isMouseDown : Boolean;

		public function Draw3DTest()
		{
			
			g3d = new Graphics3D(this);
			
			g3d.lineStyle(1, 0xff0000, 1); 
			g3d.moveTo(-10, 0, -10);
			g3d.lineTo(10, 10, 10); 
			
			
			
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
