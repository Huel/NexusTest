package  
{
	import starling.display.DisplayObject;
	import starling.events.EnterFrameEvent;
	import starling.text.TextField;
	import starling.display.BlendMode;
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
		
		public function Game() 
		{
			
			var background:Image = new Image(Assets.getTexture("Background"));
            background.blendMode = BlendMode.NONE;
			background.scaleX = 2.0;
			background.scaleY = 2.0;
            addChild(background);
			
			var textField:TextField = new TextField(800, 50, "Welcome to SHOOT THE FUCKING BIRDS!");
			addChild(textField);
			
			
			
			
		
		}
		
	}

}