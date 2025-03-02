<#-- @formatter:off -->
<#include "../mcitems.ftl">
{
    <#if data.group?has_content>"group": "${data.group}",</#if>
    "type": "minecraft:smelting",
    "experience": ${data.xpReward},
	"cookingtime": ${data.cookingTime},
    "ingredient": {
      ${mappedMCItemToItemObjectJSON(data.smeltingInputStack)}
    },
    "result": "${mappedMCItemToRegistryName(data.smeltingReturnStack)}"
}
<#-- @formatter:on -->