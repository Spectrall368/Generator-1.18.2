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
    <#elseif field_list$value[i] == "down" || field_list$value[i] == "up" || field_list$value[i] == "north" || field_list$value[i] == "south" || field_list$value[i] == "west" || field_list$value[i] == "east">
        <#assign propertyType = "(Property<?>) " + mappedBlockToBlock(w.itemBlock(field$block)) + ".getStateDefinition().getProperty(">
        <#assign valueType = "">
        <#switch field_list$value[i]>
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
        .setValue((EnumProperty) (${propertyType}"axis")), ${valueType}.getAxis())
        <#assign propertyType = "(DirectionProperty) " + mappedBlockToBlock(w.itemBlock(field$block)) + ".getStateDefinition().getProperty(">
    <#else>
        <#assign propertyType = "(EnumProperty) " + mappedBlockToBlock(w.itemBlock(field$block)) + ".getStateDefinition().getProperty(">
        <#assign valueType = "(Enum) (" + propertyType + "\"" + field_list$property[i] + "\")" +  ").getValue(\"" + field_list$value[i] + "\").get()">
    </#if>
    .setValue(${propertyType}"${field_list$property[i]}"), ${valueType})
</#list>
</#if>