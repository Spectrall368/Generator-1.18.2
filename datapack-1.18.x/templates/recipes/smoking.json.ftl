<#-- @formatter:off -->
<#include "../mcitems.ftl">
{
    <#if data.group?has_content>"group": "${data.group}",</#if>
    "type": "minecraft:smoking",
    "experience": ${data.xpReward},
	"cookingtime": ${data.cookingTime},
    "ingredient": {
      ${mappedMCItemToItemObjectJSON(data.smokingInputStack)}
    },
    "result": "${mappedMCItemToRegistryName(data.smokingReturnStack)}"
}
<#-- @formatter:on -->