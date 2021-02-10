//
// FOnline default effect
// For sprites
//

#include "IOStructures.inc"

sampler2D ColorMap;
sampler2D EggMap;


// Vertex shader
AppToVsToPs_2DEgg VSSimple(AppToVsToPs_2DEgg input)
{
	// Just pass forward
	return input;
}

// Pixel shader
float4 PSSimple(AppToVsToPs_2DEgg input) : COLOR
{
	// Sample
	float4 output = tex2D(ColorMap, input.TexCoord);

	// Egg transparent
	if(input.TexEggCoord.x != 0.0f) output.a *= tex2D(EggMap, input.TexEggCoord).a;

	return output;
}


// Techniques
technique Simple
{
	pass p0
	{
		VertexShader = (compile vs_2_0 VSSimple());
		PixelShader  = (compile ps_2_0 PSSimple());
	}
}

