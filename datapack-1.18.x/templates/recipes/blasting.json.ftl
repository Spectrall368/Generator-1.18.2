<#-- @formatter:off -->
<#include "../mcitems.ftl">
{
    <#if data.group?has_content>"group": "${data.group}",</#if>
    "type": "minecraft:blasting",
    "experience": ${data.xpReward},
	"cookingtime": ${data.cookingTime},
    "ingredient": {
      ${mappedMCItemToItemObjectJSON(data.blastingInputStack)}
    },
    "result": "${mappedMCItemToRegistryName(data.blastingReturnStack)}"
}
<#-- @formatter:on -->