package  
{
	
	import flash.display.Scene;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;

	
	
	/**
	 * ...
	 * @author Huel
	 */
	public class Player extends Sprite
	{
		
		public function Player() 
		{
			var Crosshairs:Image = new Image(Assets.getTexture("Crosshairs"));
			Crosshairs.x = -Crosshairs.width/2;
            Crosshairs.y = -Crosshairs.height/2;
			addChild(Crosshairs);
			
		}
		
	}

}