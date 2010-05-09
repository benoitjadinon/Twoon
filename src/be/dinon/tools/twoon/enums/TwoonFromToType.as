package be.dinon.tools.twoon.enums
{
	public class TwoonFromToType
	{
		public static const FROM:TwoonFromToType = new TwoonFromToType("from");
		public static const TO:TwoonFromToType = new TwoonFromToType("to");
		
		public var name:String;
		
		private static var _list:Array;
		public static function get list():Array
		{
			return _list;
		}
		
		public function TwoonFromToType(property:String)
		{
			this.name = name;
			
			if (_list == null) _list = new Array();
			_list.push(this);
		}

	}
}