package flexUnitTests
{
	import be.dinon.tools.twoon.Twoon;
	
	import flash.display.Sprite;
	
	import org.flexunit.asserts.assertNotNull;

	public class TwoonCase
	{
		private var testObject:Sprite;
		private var twoon:Twoon;
		
		[Before]
		public function setUp():void
		{
			testObject = new Sprite();
			testObject.graphics.beginFill(Math.random()*0xFFFFFF);
			testObject.graphics.drawRect(0,0,320,240);
			testObject.graphics.endFill();
			//addChild(testObject);
			
			twoon = new Twoon(testObject, null);
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function launch():void
		{
			assertNotNull(twoon.start());
		}	
	
	}
}