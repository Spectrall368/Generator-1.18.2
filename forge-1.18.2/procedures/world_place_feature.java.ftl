<#include "mcelements.ftl">
if (world instanceof ServerLevel _level)
	_level.registryAccess().registryOrThrow(Registry.CONFIGURED_FEATURE_REGISTRY)
	.getHolderOrThrow(ResourceKey.create(Registry.CONFIGURED_FEATURE_REGISTRY, new ResourceLocation("${generator.map(field$feature, "configuredfeatures")}"))
	.value().place(_level, _level.getChunkSource().getGenerator(), _level.getRandom(), ${toBlockPos(input$x,input$y,input$z)});