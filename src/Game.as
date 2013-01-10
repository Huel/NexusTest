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
	
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Event;
	import flash.geom.Point;
	import starling.display.Button;
	
	/**
	 * ...
	 * @author Huel
	 */
	public class Game extends Sprite
	{
		var player:Player = new Player();
		
		public function Game() 
		{
			//Inserting the Background 
			var background:Image = new Image(Assets.getTexture("Background"));
            background.blendMode = BlendMode.NONE;
            addChild(background);
			
			//Inserting the Headline
			var textField:TextField = new TextField(1280, 50, "Welcome to SHOOT THE FUCKING BIRDS!!!");
			addChild(textField);
			
			//Adding the Player Marker
			addChild(player);
			player.x = background.width/2; //TO DO: Should be set by the Stage 
			player.y = background.height/2;
			
			//Adding the EventListenter to the Stage
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		
		//Tracking Touches
		private function onAdded(e:Event):void
		{
			stage.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		
		//Reacting to Touches
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage, TouchPhase.BEGAN);
			if (touch == null) return;
			
			var pos:Point = touch.getLocation(stage);
			
			
			player.x = pos.x;
			player.y = pos.y;	
		
		}
		
	}

}