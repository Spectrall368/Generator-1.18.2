<#include "mcitems.ftl">
<#include "trees.ftl">
new TreeConfiguration.TreeConfigurationBuilder(${toStateProvidertoFeatureState(input$trunk)},
<#if field$type == "pine">
<@simpleTrunkPlacer "minecraft:straight_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
<#else>
<@simpleTrunkPlacer "minecraft:giant_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
</#if>, ${toStateProvidertoFeatureState(input$foliage)},
<#if field$type == "pine">
new PineFoliagePlacer(ConstantInt.of(1), ConstantInt.of(1), ${input$foliage_height}), <@twoLayersFeatureSize limit=2 lower_size=0 upper_size=2/>
<#else>
new MegaPineFoliagePlacer(ConstantInt.of(0), ConstantInt.of(0), ${input$foliage_height}), <@twoLayersFeatureSize limit=1 lower_size=1 upper_size=2/>
</#if>).dirt(${toStateProvidertoFeatureState(input$dirt)})<#if field$force_dirt == "TRUE">.forceDirt()</#if>
<#if field$ignore_vines == "TRUE">.ignoreVines()</#if>.decorators(ImmutableList.of(<#list input_list$decorator as decorator>${decorator}<#sep>,</#list>)).build()