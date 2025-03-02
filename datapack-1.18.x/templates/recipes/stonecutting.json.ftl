<#-- @formatter:off -->
<#include "../mcitems.ftl">
{
    <#if data.group?has_content>"group": "${data.group}",</#if>
    "type": "minecraft:stonecutting",
    "count": ${data.recipeRetstackSize},
    "ingredient": {
        ${mappedMCItemToItemObjectJSON(data.stoneCuttingInputStack)}
    },
    "result": "${mappedMCItemToRegistryName(data.stoneCuttingReturnStack)}"
}
<#-- @formatter:on -->