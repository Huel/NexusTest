package  
{
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
    import flash.media.Sound;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    
    import starling.text.BitmapFont;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;
	/**
	 * This class manages all our Assets
	 * @author Huel
	 */
	public class Assets 
	{
		//Font for the game 
		[Embed(source = "../assets/fonts/AngryNerds.ttf", embedAsCFF="false", fontFamily="AngryNerd")]
        public static const NerdFont:Class;
		
		//Will be used as Targets in the game
		[Embed(source="../assets/texture/starling_round.png")]
		private var Target:Class;
		
		//Will be used as Player in the game
		[Embed(source = "../assets/texture/crosshairs.png")]
        public static const Crosshairs:Class;
		
		//Will be used as Background in the game
		[Embed(source = "../assets/texture/background.jpg")]
        public static const Background:Class;
		
		//StartButton
		[Embed(source = "../assets/texture/ButtonBig.png")]
        public static const ButtonBig:Class;
		
		//Texture cache
		private static var sContentScaleFactor:int = 1;
        private static var sTextures:Dictionary = new Dictionary();
        private static var sTextureAtlas:TextureAtlas;
        private static var sBitmapFontsLoaded:Boolean;
		
		
		//This sets the single Frames of an Animation-Sprite and stores it in the atlas?
		public static function createAtlasAnim(name:String,w:int,h:int,frames:int):TextureAtlas
		{
			var texture:Texture = getTexture(name);
			
			var atlas:TextureAtlas = new TextureAtlas (texture);
			var hNew:int = texture.height / h;
			var wNew:int = texture.width / w;
		
			
			for (var i:int = 0; i < frames; i++)
			{
				var x:int = i%w;
				var y:int = i/w;
			
				var nameNew:String = String(i);
				while ( nameNew.length < 3 )
				{
					nameNew = "0" + nameNew;
				}
				atlas.addRegion(name+nameNew, new Rectangle(x*wNew,y*hNew, wNew, hNew));
				
				
			}
			
			return atlas;
			
		}
		//Gets the texture from files (Target,Player, etc..) 
		 public static function getTexture(name:String):Texture
        {
            if (sTextures[name] == undefined)
            {
                var data:Object = create(name);
                
                if (data is Bitmap)
                    sTextures[name] = Texture.fromBitmap(data as Bitmap, true, false, sContentScaleFactor);
                else if (data is ByteArray)
                    sTextures[name] = Texture.fromAtfData(data as ByteArray, sContentScaleFactor);
            }
            
            return sTextures[name];
        }
		
		public static function getTextureAtlas():TextureAtlas
        {
            if (sTextureAtlas == null)
            {
                var texture:Texture = getTexture("AtlasTexture");
                var xml:XML = XML(create("AtlasXml"));
                sTextureAtlas = new TextureAtlas(texture, xml);
            }
            
            return sTextureAtlas;
        }
		
		//Prepares Fonts for Usage
		 public static function loadBitmapFonts():void
        {
            if (!sBitmapFontsLoaded)
            {
                var texture:Texture = getTexture("DesyrelTexture");
                var xml:XML = XML(create("DesyrelXml"));
                TextField.registerBitmapFont(new BitmapFont(texture, xml));
                sBitmapFontsLoaded = true;
            }
        }
		
		 private static function create(name:String):Object
        {
            var textureClass:Class = Assets;
            return new textureClass[name];
        }
     
        
		
	}

}