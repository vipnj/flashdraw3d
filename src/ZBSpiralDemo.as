package
{
	import com.zenbullets.draw3dDemos.DrawCanvas;
	import com.zenbullets.draw3dDemos.spiral.SpiralDemo;
	
	import flash.display.Sprite;
	
	[SWF(width="500", height= "500", backgroundColor="0x000000", frameRate="30")]    
	
	public class ZBSpiralDemo extends Sprite
	{
		public function ZBSpiralDemo()
		{
			var demo:DrawCanvas = new SpiralDemo(500, 500);
			addChild(demo);    
		}
	}
}