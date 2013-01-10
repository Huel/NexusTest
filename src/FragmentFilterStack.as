package  
{
    import flash.display3D.Context3D;
    import starling.textures.Texture;
	import starling.filters.FragmentFilter;

	public class FragmentFilterStack extends FragmentFilterEx 
	{
		private var mNumPasses:int;
		public var mFilters:Vector.<FragmentFilter> = new Vector.<FragmentFilter>();
		
		public function FragmentFilterStack(numPasses:int, resolution:Number=1.0)
		{
			super(numPasses,resolution);
			mNumPasses = numPasses;
		}
		
		
		public override function dispose():void
        {
            super.dispose();
			for (var i:int = 0; i < mNumPasses; ++i)
			{
				mFilters[i].dispose();
			}
        }

		protected override function createPrograms():void
        {
			/*for (var i:int = 0; i < mNumPasses; ++i)
			{
				var 
				mFilters[i].createPrograms();
			}*/
        }

        public override function activate(pass:int, context:Context3D, texture:Texture):void
        {
			var xFS:FragmentFilter = mFilters[pass];
			xFS.activate(0,context,texture);
        }
		
		
        public override function deactivate(pass:int, context:Context3D, texture:Texture):void
        {
			mFilters[pass].deactivate(0,context,texture);
        };
	}

}