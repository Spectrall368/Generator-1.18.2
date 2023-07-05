<#include "mcelements.ftl">
new RandomPatchFeature(<#if field$tries != "128"> ${field$tries}</#if>,<#if field$xzSpread != "7"> ${field$xzSpread}</#if>,<#if field$ySpread != "3"> ${field$ySpread}</#if>,
    ${toPlacedFeature(input_id$feature, input$feature)})
