package  
{
    import starling.core.Starling;
	import starling.filters.FragmentFilter;

    import flash.display3D.Context3D;
    import flash.display3D.Context3DProgramType;
    import flash.display3D.Program3D;
	
	import com.adobe.utils.AGALMacroAssembler;
	
	public class FragmentFilterEx extends FragmentFilter 
	{
		public static const STDLIB:String =
			"macro length(x){dp3 out, x, x;sqt out, out;}\n";
		
		public function FragmentFilterEx() 
		{
		}
		
		protected override function assembleAgal(fragmentShader:String=null, vertexShader:String=null):Program3D
        {
            if (fragmentShader == null) fragmentShader = STD_FRAGMENT_SHADER;
            if (vertexShader   == null) vertexShader   = STD_VERTEX_SHADER;
            
            var vertexProgramAssembler:AGALMacroAssembler = new AGALMacroAssembler();
            vertexProgramAssembler.assemble(Context3DProgramType.VERTEX, STDLIB+vertexShader);
            
            var fragmentProgramAssembler:AGALMacroAssembler = new AGALMacroAssembler();
            fragmentProgramAssembler.assemble(Context3DProgramType.FRAGMENT, STDLIB+fragmentShader);
            
            var context:Context3D = Starling.context;
            var program:Program3D = context.createProgram();
            program.upload(vertexProgramAssembler.agalcode, fragmentProgramAssembler.agalcode);          
            
            return program;
        }
	}

}