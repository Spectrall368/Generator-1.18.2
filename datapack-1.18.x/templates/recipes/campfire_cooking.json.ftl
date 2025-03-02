<#-- @formatter:off -->
<#include "../mcitems.ftl">
{
    <#if data.group?has_content>"group": "${data.group}",</#if>
    "type": "minecraft:campfire_cooking",
    "experience": ${data.xpReward},
	"cookingtime": ${data.cookingTime},
    "ingredient": {
      ${mappedMCItemToItemObjectJSON(data.campfireCookingInputStack)}
    },
    "result": "${mappedMCItemToRegistryName(data.campfireCookingReturnStack)}"
}
<#-- @formatter:on -->