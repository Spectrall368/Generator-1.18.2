<#include "mcitems.ftl">
/*@int*/(${mappedBlockToBlock(input$block)}.getStateDefinition().getProperty(${input$property}) instanceof IntegerProperty _getip${cbi} ? ${mappedBlockToBlockStateCode(input$block)}.getValue(_getip${cbi}) : -1)
