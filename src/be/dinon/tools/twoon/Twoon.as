package be.dinon.tools.twoon
{
	import be.dinon.tools.twoon.adapters.TwoonAdapter;
	import be.dinon.tools.twoon.enums.TwoonEasingMovement;
	import be.dinon.tools.twoon.enums.TwoonEasingType;
	import be.dinon.tools.twoon.enums.TwoonProperty;
	import be.dinon.tools.twoon.vos.TwoonValue;
	
	import flash.events.EventDispatcher;

	public class Twoon extends EventDispatcher
	{
		private var adapter:TwoonAdapter;
		
		public function Twoon(target:Object, adapter:TwoonAdapter)
		{
			super();
			this.adapter = adapter;
			adapter.setTarget(target);
		}
		
		public static function init(target:Object=null, adapter:TwoonAdapter=null):Twoon 
		{
			var twoon:Twoon = new Twoon(target, adapter);
			return twoon;
		}
		
		public function target(target:Object):Twoon
		{
			adapter.setTarget(target);
			return this;
		}
		
		public function value(property:TwoonProperty, toValue:*=null, fromValue:*=null):Twoon
		{
			var valueVO:TwoonValue = new TwoonValue(property, toValue, fromValue);
			adapter.addValue(valueVO);
			return this;
		}
		
		public function duration(millisec:int):Twoon
		{
			adapter.setDuration(millisec);
			return this;
		}
		
		public function ease(type:TwoonEasingType, movement:TwoonEasingMovement /*= TwoonEasingMovement.OUT*/):Twoon
		{
			adapter.setEasing(type);
			adapter.setMovement(movement);
			return this;
		}
		
		public function delay(milliseconds:int):Twoon
		{
			adapter.setDelay(milliseconds);
			return this;
		}
		
		public function onUpdate(handler:Function, ...args):Twoon
		{
			adapter.setUpdateHandler(handler, args);
			return this;
		}

		public function start():Twoon
		{
			adapter.start();
			return this;
		}
	}
}