package be.dinon.tools.twoon.adapters
{
	import be.dinon.tools.twoon.enums.TwoonEasingMovement;
	import be.dinon.tools.twoon.enums.TwoonEasingType;
	import be.dinon.tools.twoon.enums.TwoonFromToType;
	import be.dinon.tools.twoon.enums.TwoonProperty;
	import be.dinon.tools.twoon.errors.TwoonError;
	import be.dinon.tools.twoon.vos.TwoonValue;
	
	import flash.errors.IllegalOperationError;
	import flash.events.EventDispatcher;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	import mx.utils.ObjectUtil;
	
	public class TwoonAdapterAbstract extends EventDispatcher implements TwoonAdapter
	{
		public var target:Object;

		private var values:Array;
		
		public var duration:int = 1000;
		public var easing:TwoonEasingType = TwoonEasingType.CUBIC;
		public var movement:TwoonEasingMovement = TwoonEasingMovement.OUT;
		public var delay:int;
		protected var updateHandler:Function;
		protected var updateParams:Array;
		protected var completeHandler:Function;
		protected var completeParams:Array;
		
		public function TwoonAdapterAbstract(self:TwoonAdapterAbstract)
		{
			if(self != this)
			{
				//only a subclass can pass a valid reference to self
				throw new IllegalOperationError("Abstract class did not receive reference to self. TwoonAdapterAbstract cannot be instantiated directly.");
			}
			
			//these functions MUST be implemented in subclasses
			var unimplemented:Array = [start];
			
			//get the fully-qualified name the abstract class
			var abstractTypeName:String = getQualifiedClassName(TwoonAdapterAbstract);
			
			//get a list of all the methods declared by the abstract class
			//if a subclass overrides a function, declaredBy will contain the subclass name
			var selfDescription:XML = describeType(this);
			var methods:XMLList = selfDescription.method.(@declaredBy == abstractTypeName && unimplemented.indexOf(this[@name]) >= 0);
			
			if(methods.length() > 0)
			{
				//we'll only get here if the function is still unimplemented
				var concreteTypeName:String = getQualifiedClassName(this);
				throw new IllegalOperationError("Function " + methods[0].@name + " from abstract class " + abstractTypeName + " has not been implemented by subclass " + concreteTypeName);
			}
			
			// init
			
			values = new Array();
		}

		
		// PUBLIC METHODS
		
		public function setTarget(target:Object):void 
		{
			this.target = target;
		}

		public function addValue(value:TwoonValue):void 
		{
			values.push(value);
		}
		
		public function setDuration(milliSeconds:int):void 
		{
			duration = milliSeconds;
		}
		
		public function setEasing(type:TwoonEasingType):void
		{
			if (type != null) easing = type;
		}
		
		public function setMovement(type:TwoonEasingMovement):void
		{
			if (type != null) movement = type;
		}
		
		public function setDelay(milliSeconds:int):void
		{
			delay = milliSeconds;
		}
		
		public function setUpdateHandler(handler:Function, params:Array):void
		{
			updateHandler = handler;
			updateParams = params
		}	
		
		public function setCompleteHandler(handler:Function, params:Array):void
		{
			completeHandler = handler;
			completeParams = params
		}	
		
		
		// TO OVERRIDE
		public function start():void 
		{
			if (target == null) throw new TwoonError("target not defined");
			if (values.length == 0) throw new TwoonError("values not defined");
		}
		
		
		
		// PROTECTED METHODS
		
		protected function getFromValues():Array
		{
			var ret:Array = new Array();
			for each(var value:TwoonValue in values)
			{
				if (value.fromValue != null) {
					if (value.property == TwoonProperty.SCALE)
					{
						ret.push(new TwoonValue(TwoonProperty.SCALE_WIDTH, value.toValue, value.fromValue));
						ret.push(new TwoonValue(TwoonProperty.SCALE_HEIGHT, value.toValue, value.fromValue));
					}
					else ret.push(value);
				}
			}
			return ret;
		}
		protected function getToValues():Array
		{
			var ret:Array = new Array();
			for each(var value:TwoonValue in values)
			{
				if (value.toValue != null) {
					if (value.property == TwoonProperty.SCALE)
					{
						ret.push(new TwoonValue(TwoonProperty.SCALE_WIDTH, value.toValue, value.fromValue));
						ret.push(new TwoonValue(TwoonProperty.SCALE_HEIGHT, value.toValue, value.fromValue));
					}
					else ret.push(value);
				}
			}
			return ret;
		}
		
		protected function getVarsObject(direction:TwoonFromToType = null):Object
		{
			var res:Object;
			res = new Object();
			return res;
		}
			
		
		protected function getDurationInSeconds():Number
		{
			return duration / 1000;
		}
		protected function getDurationInMilliseconds():Number
		{
			return duration;
		}
		protected function getDelayInSeconds():Number
		{
			return delay / 1000;
		}
		protected function getDelayInMilliseconds():Number
		{
			return delay;
		}
	}
}