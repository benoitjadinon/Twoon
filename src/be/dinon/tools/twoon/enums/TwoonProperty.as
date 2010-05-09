package be.dinon.tools.twoon.enums
{
	public class TwoonProperty
	{
		public static const X:TwoonProperty = new TwoonProperty("x");
		public static const Y:TwoonProperty = new TwoonProperty("y");
		public static const SCALE:TwoonProperty = new TwoonProperty("scale");
		public static const SCALE_WIDTH:TwoonProperty = new TwoonProperty("scaleX");
		public static const SCALE_HEIGHT:TwoonProperty = new TwoonProperty("scaleY");
		public static const ROTATION:TwoonProperty = new TwoonProperty("rotation");
		public static const TRANSPARENCY:TwoonProperty = new TwoonProperty("alpha");

		public var name:String;
		
		private static var _list:Array;
		public static function get list():Array
		{
			return _list;
		}
		
		public function TwoonProperty(name:String)
		{
			this.name = name;
			
			if (_list == null) _list = new Array();
			_list.push(this);
		}

	}
}