#include"Particle.hlsli"

struct TransformationMatrix
{
float32_t4x4 WVP;
float32_t4x4 World;
};
StructuredBuffer<TransformationMatrix> gTransformationMatrices : register(t0);


struct VertexShaderInput
{
float32_t4 position:POSITION0;
};

VertexShaderOutput main(VertexShaderInput input,uint32_t instanceId:SV_InstanceID) {
	VertexShaderOutput output;
	output.position=mul(input.position,gTransformationMatrices[instanceId].WVP);
	return output;
}