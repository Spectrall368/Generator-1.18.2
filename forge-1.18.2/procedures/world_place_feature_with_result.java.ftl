<#include "mcelements.ftl">
(world instanceof ServerLevel _level${cbi} && _level${cbi}.registryAccess().registryOrThrow(Registry.CONFIGURED_FEATURE_REGISTRY)
    .get(new ResourceLocation("${generator.map(field$feature, "configuredfeatures")}"))
    .place(_level${cbi}, _level${cbi}.getChunkSource().getGenerator(), _level${cbi}.getRandom(), ${toBlockPos(input$x,input$y,input$z)}))