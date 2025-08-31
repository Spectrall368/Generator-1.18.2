<#include "mcelements.ftl">
if (world instanceof ServerLevel _level)
    _level.registryAccess().registryOrThrow(Registry.CONFIGURED_FEATURE_REGISTRY)
    .get(new ResourceLocation("${generator.map(field$feature, "configuredfeatures")}"))
    .place(_level, _level.getChunkSource().getGenerator(), _level.getRandom(), ${toBlockPos(input$x,input$y,input$z)});