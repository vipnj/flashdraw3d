package com.sebleedelisle.draw3d 
{

	/**
	 * @author Seb Lee-Delisle
	 */
	public class LineStyleData 
	{
		
		public var thickness : Number = 0; 
		public var colour : int = 0x000000; 
		public var alpha : Number =1; 
		
		public function LineStyleData(thickness : Number = 1, colour : int = 0x000000, alpha : Number = 1) 
		{
			this.thickness = thickness; 
			this.colour = colour; 
			this.alpha = alpha; 
		}
	}
}
