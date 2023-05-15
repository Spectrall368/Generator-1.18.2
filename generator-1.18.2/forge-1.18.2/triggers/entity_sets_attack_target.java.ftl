<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onEntitySetsAttackTarget(LivingChangeTargetEvent event) {
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "event.getEntityLiving().getX()",
			"y": "event.getEntityLiving().getY()",
			"z": "event.getEntityLiving().getZ()",
			"world": "event.getEntityLiving().level",
			"entity": "event.getOriginalTarget()",
			"sourceentity": "event.getEntityLiving()",
			"event": "event"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}
