package be.dinon.tools.twoon.vos
{
	import be.dinon.tools.twoon.enums.TwoonProperty;

	public class TwoonValue
	{
		public var property:TwoonProperty;
		public var toValue:*;
		public var fromValue:*;
		
		public function get hasFromValue():Boolean { return fromValue != null; }
		public function get hasToValue():Boolean { return toValue != null; }
		
		public function TwoonValue(property:TwoonProperty, toValue:* = null, fromValue:* = null)
		{
			this.property = property;
			this.toValue = toValue;
			this.fromValue = fromValue;
		}
	}
}