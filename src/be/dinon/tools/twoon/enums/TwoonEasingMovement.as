package be.dinon.tools.twoon.enums
{
	public class TwoonEasingMovement
	{
		public static const IN:TwoonEasingMovement = new TwoonEasingMovement("easeIn");
		public static const OUT:TwoonEasingMovement = new TwoonEasingMovement("easeOut");
		public static const INOUT:TwoonEasingMovement = new TwoonEasingMovement("easeInOut");
		
		public var name:String;
		
		private static var _list:Array;
		public static function get list():Array
		{
			return _list;
		}
		
		public function TwoonEasingMovement(name:String)
		{
			this.name = name;
			
			if (_list == null) _list = new Array();
			_list.push(this);
		}
	}
}