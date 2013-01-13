package  
{
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.BlendMode;
	import starling.display.MovieClip;
	import starling.core.Starling;
	
	import starling.animation.Transitions;
    import starling.animation.Tween;

	/**
	 * ...
	 * @author ...
	 */
	public class Target extends Sprite
	{
		public var TargetClip:MovieClip;
		private var targetTransitions:Array;
		private var movementX:int = 1000;
		private var movementY:int = 400;
		private var oldX:int;
		private var oldY:int;
	
		
		public function Target(x:int, y:int) 
		{
	
			var frames:Vector.<Texture> = Assets.getTextureAtlas().getTextures("flight");
            TargetClip = new MovieClip(frames, 15);
            addChild(TargetClip);
			
			TargetClip.x = x - int(TargetClip.width / 2);
            TargetClip.y = y - int(TargetClip.height / 2);
			
			Starling.juggler.add(TargetClip);
			
			/*
			//Moving Target
			 targetTransitions 	= [Transitions.LINEAR, Transitions.EASE_OUT, Transitions.EASE_IN_OUT,
								Transitions.EASE_OUT_BACK, Transitions.EASE_OUT_BOUNCE,
								Transitions.EASE_OUT_ELASTIC];
			
			var transition:String = targetTransitions.shift();
			targetTransitions.push(transition);
			var targetTween:Tween = new Tween (TargetClip, 10, transition);
			
			targetTween.moveTo(x+Math.random()*movementX, y+Math.random()*movementY);
			targetTween.scaleTo(1.0);
			Starling.juggler.add(targetTween);
			
			targetTween.onComplete = function():void 
			{ 
				trace("Tween Done");
		
				if (TargetClip.x < 2000)
				{
					trace("Target turned");
					TargetClip.scaleX = -1.0;
					var newTargetTween:Tween = new Tween (TargetClip, 10, transition);
					newTargetTween.moveTo(x, y);
					Starling.juggler.add(newTargetTween);
				}
				
			};
			
			*/
		}
		
		public function moveTarget(x:int,y:int):void
		{
			var tweenTargetX:Number = x + Math.random() * movementX;
			var tweenTargetY:Number = y + Math.random() * movementY;
			
			 targetTransitions 	= [Transitions.LINEAR, Transitions.EASE_OUT, Transitions.EASE_IN_OUT,
								Transitions.EASE_OUT_BACK, Transitions.EASE_OUT_BOUNCE,
								Transitions.EASE_OUT_ELASTIC];
			
			var transition:String = targetTransitions.shift();
			targetTransitions.push(transition);
			var targetTween:Tween = new Tween (TargetClip, 10, transition);
			targetTween.moveTo(tweenTargetX, tweenTargetY);
			
			if (TargetClip.x < tweenTargetX)
			{
				TargetClip.scaleX = 1.0;	
			}
			else
				TargetClip.scaleX = -1.0;
				
			Starling.juggler.add(targetTween);
			
			targetTween.onComplete = function():void 
			{ 
				trace("Tween Done");
		
				if (TargetClip.x < 2000)
				{
					trace("Target turned");
					TargetClip.scaleX = -1.0;
					var newTargetTween:Tween = new Tween (TargetClip, 10, transition);
					newTargetTween.moveTo(x, y);
					Starling.juggler.add(newTargetTween);
				}
				
			};
			
		}
		
	}

}