package  
{
	import flash.geom.Vector3D;
	import starling.filters.FragmentFilter;
    import flash.display3D.Context3D;
    import flash.display3D.Context3DProgramType;
    import flash.display3D.Program3D;
	import flash.geom.Point;
    
    import starling.textures.Texture;
	
	public class PixelLightFilter extends FragmentFilterEx 
	{
		private var mShaderProgram:Program3D;
		private var mQuantifiers:Vector.<Number> = new <Number>[1, 1, 1, 32];
        private var mPixelSize:int;
		
		public static var mLightPos:Vector3D=new Vector3D();

        /** helper objects */
        private static var sTmpPoint:Vector.<Number> = new Vector.<Number>(4, true);
		private static const CONSTANTS:Vector.<Number> = new <Number>[0, 1, 300, 2];
		
		public function PixelLightFilter() 
		{
			
		}
		
		 public function PixelateFilter(pixelSize:int)
        {
            mPixelSize = pixelSize;
        }
		
        public override function dispose():void
        {
            if (mShaderProgram) mShaderProgram.dispose();
            super.dispose();
        }

		protected override function createPrograms():void
        {
             fc0: mLightPos
			 fc1: CONSTANTS
			 fc2: mQuantifiers

            var vertexProgramCode:String =
				"mov v0, va1       \n"+  	// pass texture coordinates to fragment program
				"m44 vt0, va0, vc0 \n"+  	// 4x4 matrix transform to output space
				"mov v1, vt0       \n"+
				"mov op, vt0       \n";  
				
				
				
				//macro equivalent of the two operations above
				//v0=va1;
				//op=mul4x4(va0, vc0);


            var fragmentProgramCode:String =
				
				"sub ft1, v1, fc0								     \n" +
				"dp3 ft5.x, ft1, ft1                                 \n" + //ft1.x=length(ft1);
				"sqt ft5.x, ft5.x                                    \n" +
				"sat ft5.x, ft5.x                                    \n" +
			
				
				"mov ft6.x, ft5.x                                    \n" +
				"mul ft6.x, fc2.w, ft6.x                             \n" +
				
				"alias ft6.x,blurfact;                               \n" +
				
			    "mov ft2, fc2                                     	 \n" +
				"div ft2, blurfact, ft2                              \n" +
				"div ft0, v0, ft2                                    \n" +
                "frc ft1, ft0                                        \n" +
                "sub ft0, ft0, ft1                                   \n" +
                "mul ft0, ft0, ft2                                   \n" +
				
				"tex ft0, ft0,  fs0 <2d, clamp, nearest, mipnone>    \n" + // read texture color
				
				"sub ft4.x, fc1.y, ft5.x                             \n" +
				"sat ft4.x, ft4.x                                    \n" +
				"mul ft0.xyz, ft0.xyz, ft4.x					     \n" +
				"mov oc, ft0                                         \n" ;  // copy to output
               
            mShaderProgram = assembleAgal(fragmentProgramCode, vertexProgramCode);
		}

        protected override function activate(pass:int, context:Context3D, texture:Texture):void
		{
			var vLP:Vector3D=mCurSupport.mvpMatrix3D.transformVector(mLightPos);
			sTmpPoint[0] = vLP.x;
			sTmpPoint[1] = vLP.y;
			sTmpPoint[2] = vLP.z;
			
			mQuantifiers[0] = texture.width;
            mQuantifiers[1] = texture.height;
			
			context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, sTmpPoint);
			context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 1, CONSTANTS);
			context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 2, mQuantifiers);
			
            context.setProgram(mShaderProgram);
        }
		
		public function get pixelSize():int { return mPixelSize; }
        public function set pixelSize(value:int):void { mPixelSize = value; }
		
		

	}

}