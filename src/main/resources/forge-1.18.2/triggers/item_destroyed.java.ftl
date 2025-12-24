<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onItemDestroyed(PlayerDestroyItemEvent event) {
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
			"x": "event.getPlayer().getX()",
			"y": "event.getPlayer().getY()",
			"z": "event.getPlayer().getZ()",
			"world": "event.getPlayer().level",
			"entity": "event.getPlayer()",
			"itemstack": "event.getOriginal()",
			"event": "event"
			}/>
		</#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}