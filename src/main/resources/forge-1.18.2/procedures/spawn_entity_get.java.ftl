<@addTemplate file="utils/entity/spawn_entity_get.java.ftl"/>
<#include "mcelements.ftl">
<#assign entity = generator.map(field$entity, "entities", 1)!"null">
<#if entity != "null">
(world instanceof ServerLevel _level${cbi} ? spawnEntity(new ${generator.map(field$entity, "entities", 0)}(${entity}, _level${cbi}), ${toBlockPos(input$x,input$y,input$z)}, world) : null)
<#else>
null
</#if>
