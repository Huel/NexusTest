package  
{
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.BlendMode;
	import starling.display.MovieClip;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Target extends Sprite
	{
		private var TargetClip:MovieClip;
		
		public function Target(x:int, y:int) 
		{
			var frames:Vector.<Texture> = Assets.getTextureAtlas().getTextures("flight");
            TargetClip = new MovieClip(frames, 15);
            addChild(TargetClip);
			
			TargetClip.x = x - int(TargetClip.width / 2);
            TargetClip.y = y - int(TargetClip.height / 2);
			
			Starling.juggler.add(TargetClip);
			
			
		}
		
	}

}