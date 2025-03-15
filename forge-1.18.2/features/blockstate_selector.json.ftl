<#include "mcitems.ftl">
${mappedBlockToBlock(w.itemBlock(field$block))}
<#if field_list$property?size != 0>
.defaultBlockState()
<#list 0..field_list$property?size-1 as i>
    <#if field_list$value[i] == "true" || field_list$value[i] == "false">
        <#assign propertyType = "(BooleanProperty) " + mappedBlockToBlock(w.itemBlock(field$block)) + ".getStateDefinition().getProperty(">
        <#assign valueType = field_list$value[i]>
    <#elseif field_list$value[i]?string?matches("^-?\\d+$")>
        <#assign propertyType = "(IntegerProperty) " + mappedBlockToBlock(w.itemBlock(field$block)) + ".getStateDefinition().getProperty(">
        <#assign valueType = field_list$value[i]>
    <#else>
        <#assign propertyType = "(EnumProperty) " + mappedBlockToBlock(w.itemBlock(field$block)) + ".getStateDefinition().getProperty(">
        <#assign valueType = "(Enum) (" + propertyType + "\"" + field_list$property[i] + "\")" +  ").getValue(\"" + field_list$value[i] + "\").get()">
    </#if>
    .setValue(${propertyType}"${field_list$property[i]}"), ${valueType})
</#list>
</#if>