<#include "mcitems.ftl">
(${mappedBlockToBlock(input$block)}.getStateDefinition().getProperty(${input$property}) instanceof EnumProperty _getep${cbi} ? ${mappedBlockToBlockStateCode(input$block)}.getValue(_getep${cbi}).toString() : "")
