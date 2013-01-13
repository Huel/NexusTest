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
	import flash.media.Sound;
	import starling.display.MovieClip;
	
	import starling.animation.Transitions;
    import starling.animation.Tween;
	
	
	import PixelLightFilter;
	/**
	 * ...
	 * @author Huel
	 */
	public class Game extends starling.display.Sprite
	{
		var player:Player = new Player();
		var targetArray:Array = [];
		Assets.prepareSounds();
		var shotSound:Sound = Assets.getSound("PlayerSound");
		

		
		
		public function Game() 
		{
			 // load general assets
			
			
			//Inserting the Background 
			var background:Image = new Image(Assets.getTexture("Background"));
            background.blendMode = BlendMode.NONE;
			//background.filter = new PixelLightFilter();
            addChild(background);
			
			//Inserting the Headline
			var headline:TextField = new TextField(1280, 180, "Welcome to Shoot the Fucking Birds !!!", "AngryNerd");
			headline.fontSize = 70;
			headline.y = 80;
			//headline.filter = new PixelLightFilter();
			addChild(headline);
		
			
			//Adding the StartButton To Do: Write Button Class
			var buttonTexture:Texture = Assets.getTexture("ButtonBig");
			var button:Button = new Button(buttonTexture, "Start");
			button.fontName = "AngryNerd";
			button.scaleX = 0.5;
			button.scaleY = 0.5;
			button.x = background.width / 2  -175;
			button.y = background.height / 2 -50;
			button.fontSize = 80;
			button.fontBold = true;
			button.fontColor = 0xffffff;
			//button.filter = new PixelLightFilter();
			addChild(button);
			
			//Adding Targets to the Screen
			var target:Target = new Target(80,250)
			addChild(target);
			/*
			while ( targetArray.length < 30)
			{
				
				var target:Target = new Target(Math.random()*1280,Math.random()*800);
				addChild(target);
				targetArray.push(target);
				addChild(target);
			
			}
			*/
			
			//Adding the Player Marker
			player.x = background.width/2; //TO DO: Should be set by the Stage 
			player.y = background.height / 2;
			
			
			
			
			//player.filter = new PixelLightFilter();
			PixelLightFilter.mLightPos.x = player.x;
			PixelLightFilter.mLightPos.y = player.y;
			addChild(player);
			
			
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
			PixelLightFilter.mLightPos.x = player.x;
			PixelLightFilter.mLightPos.y = player.y;
			shotSound.play(0, 0);
		
		}
		
	}

}