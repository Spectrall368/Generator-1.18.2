new StructureModFeatureConfiguration(new ResourceLocation("${modid}:${field$structure}"), ${field$random_rotation?lower_case}, ${field$random_mirror?lower_case},
<#if !input$ignored_blocks?contains("/*@Tag*/")>HolderSet.direct(Block::builtInRegistryHolder, ${input$ignored_blocks})<#else>${input$ignored_blocks}</#if>, new Vec3i(
    <#-- #4958 - clamping needed because old converters did not clamp this correctly --->
     <#if (field$x?number < -47)>-47<#elseif (field$x?number > 47)>47<#else>${field$x}</#if>,
     <#if (field$y?number < -47)>-47<#elseif (field$y?number > 47)>47<#else>${field$y}</#if>,
     <#if (field$z?number < -47)>-47<#elseif (field$z?number > 47)>47<#else>${field$z}</#if>))