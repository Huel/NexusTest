package  
{
	import starling.display.Sprite;
	import starling.extensions.PDParticleSystem;
    import starling.extensions.ParticleSystem;
	import starling.textures.Texture;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ParticleManager extends Sprite
	{
		private var mParticleSystems:Vector.<ParticleSystem>;
		private var mParticleSystem:ParticleSystem;
		
		public function ParticleManager() 
		{
			var drugsConfig:XML = Assets.getXML("DrugsConfig");
			var drugsTexture:Texture = Assets.getTexture("DrugsParticle");
			
			mParticleSystems = new <ParticleSystem>[
				new PDParticleSystem(drugsConfig, drugsTexture)
			];
				
		}
		
		public function startParticleSystem(x:int , y:int ):void
        {
            if (mParticleSystem)
            {
                mParticleSystem.stop();
                mParticleSystem.removeFromParent();
                Starling.juggler.remove(mParticleSystem);
            }
            
            mParticleSystem = mParticleSystems.shift();
            mParticleSystems.push(mParticleSystem);

            mParticleSystem.emitterX = x;
            mParticleSystem.emitterY = y;
            mParticleSystem.start();
            
            addChild(mParticleSystem);
            Starling.juggler.add(mParticleSystem);
        }
        
     
	}

}