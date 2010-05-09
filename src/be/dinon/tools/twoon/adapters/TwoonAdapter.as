package be.dinon.tools.twoon.adapters
{
	import be.dinon.tools.twoon.enums.TwoonEasingMovement;
	import be.dinon.tools.twoon.enums.TwoonEasingType;
	import be.dinon.tools.twoon.enums.TwoonProperty;
	import be.dinon.tools.twoon.vos.TwoonValue;

	public interface TwoonAdapter
	{
		function setTarget(target:Object):void;
		
		function addValue(value:TwoonValue):void;
		
		function setDuration(millisec:int):void;
		
		function setEasing(type:TwoonEasingType):void;
		
		function setMovement(type:TwoonEasingMovement):void
		
		function setDelay(milliseconds:int):void;
		
		function setUpdateHandler(handler:Function, params:Array):void;
		
		function start():void;
	}
}