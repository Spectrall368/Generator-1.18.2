<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onEntitySetsAttackTarget(LivingSetAttackTargetEvent event) {
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
			"x": "event.getEntityLiving().getX()",
			"y": "event.getEntityLiving().getY()",
			"z": "event.getEntityLiving().getZ()",
			"world": "event.getEntityLiving().level",
			"entity": "event.getTarget()",
			"sourceentity": "event.getEntityLiving()",
			"event": "event"
			}/>
		</#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}