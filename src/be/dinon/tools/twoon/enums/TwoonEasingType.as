package be.dinon.tools.twoon.enums
{
	public class TwoonEasingType
	{
		public static const BACK:TwoonEasingType = new TwoonEasingType("Back");
		public static const CUBIC:TwoonEasingType = new TwoonEasingType("Cubic");
		public static const ELASTIC:TwoonEasingType = new TwoonEasingType("Elastic");
		public static const EXPO:TwoonEasingType = new TwoonEasingType("Expo");
		public static const LINEAR:TwoonEasingType = new TwoonEasingType("Linear");
		public static const QUAD:TwoonEasingType = new TwoonEasingType("Quad");
		public static const QUART:TwoonEasingType = new TwoonEasingType("Quart");
		public static const QUINT:TwoonEasingType = new TwoonEasingType("Quint");
		
		public var name:String;
		
		private static var _list:Array;
		public static function get list():Array
		{
			return _list;
		}
		
		public function TwoonEasingType(name:String)
		{
			this.name = name;
			
			if (_list == null) _list = new Array();
			_list.push(this);
		}
	}
}