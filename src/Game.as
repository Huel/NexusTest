package  
{
	import starling.display.DisplayObject;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
    import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Huel
	 */
	public class Game extends Sprite
	{
		[Embed(source="../assets/starling_round.png")]
		private var TestImage:Class;
		
		public function Game() 
		{
				AddImage(200,200);
		
		}
		
		private function AddImage(x:int, y:int):void
		{
			var xTest:Image = new Image(Texture.fromBitmap(new TestImage));
			addChild(xTest);
			
		};
		
	}

}