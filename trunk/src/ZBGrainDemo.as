package
{
	import com.zenbullets.draw3dDemos.DrawCanvas;
	import com.zenbullets.draw3dDemos.grain.GrainDemo;
	
	import flash.display.Sprite;
	
	[SWF(width="500", height= "500", backgroundColor="0x000000", frameRate="30")]    
	
	public class ZBGrainDemo extends Sprite
	{
		public function ZBGrainDemo()
		{
			var demo:DrawCanvas = new GrainDemo(1000, 1000);
			demo.width = 500;
			demo.height = 500;    
			
			addChild(demo);    
		}
	}
}