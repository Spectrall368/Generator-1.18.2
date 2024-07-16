<#include "mcitems.ftl">
/*@BlockStateProvider*/new RandomizedIntStateProvider(${mappedBlockToBlockStateProvider(input$source)}, ${mappedBlockToBlock(input$source)}.getStateDefinition().getProperty("${field$property}"), ${input$value})
