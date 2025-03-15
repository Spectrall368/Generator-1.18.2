<#include "mcitems.ftl">
${mappedBlockToBlock(w.itemBlock(field$block))}
<#if field_list$property?size != 0>
<#list 0..field_list$property?size-1 as i>
    .setValue(${field_list$property[i]}", "${field_list$value[i]}")
</#list>
</#if>
