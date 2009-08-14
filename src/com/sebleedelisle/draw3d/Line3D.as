package com.sebleedelisle.draw3d 
{

	/**
	 * @author Seb Lee-Delisle
	 */
	public class Line3D  
	{
		
		public var pointIndexStart : int;
		public var pointIndexEnd : int; 
		public var lineStyle : LineStyleData;

		public function Line3D(pointindexstart : int, pointindexend : int, linestyle : LineStyleData) 
		{
			this.pointIndexStart = pointindexstart; 
			this.pointIndexEnd = pointindexend; 
			this.lineStyle = linestyle; 
		}
	}
}
