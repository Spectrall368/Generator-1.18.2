<#include "mcitems.ftl">
<#assign blockT = mappedBlockToBlock(w.itemBlock(field$block))>
<#if field_list$property?size != 0>
<#list 0..field_list$property?size-1 as i>
    <#assign valueType = field_list$value[i]>
    <#if valueType == "down" || valueType == "up" || valueType == "north" || valueType == "south" || valueType == "west" || valueType == "east">
        <#switch valueType>
          <#case "west">
            <#assign valueType = "Direction.WEST">
            <#break>
          <#case "east">
            <#assign valueType = "Direction.EAST">
            <#break>
          <#case "north">
            <#assign valueType = "Direction.NORTH">
            <#break>
          <#case "south">
            <#assign valueType = "Direction.SOUTH">
            <#break>
          <#case "up">
            <#assign valueType = "Direction.UP">
            <#break>
          <#default>
            <#assign valueType = "Direction.DOWN">
            <#break>
        </#switch>
    <#elseif valueType != "true" || valueType != "false" && !valueType?string?matches("^-?\\d+$")>
        <#assign valueType = "\"" + field_list$value[i] + "\"">
    </#if>
    ${JavaModName}FeatureUtils.addProperty(${blockT}.defaultBlockState(), "${field_list$property[i]}", ${valueType})
</#list>
<#else>
${blockT}
</#if>