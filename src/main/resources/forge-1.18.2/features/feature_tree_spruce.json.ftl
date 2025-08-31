<#include "mcitems.ftl">
<#include "trees.ftl">
new TreeConfiguration.TreeConfigurationBuilder(${toStateProvidertoFeatureState(input$trunk)}, <@simpleTrunkPlacer "minecraft:straight_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>,
${toStateProvidertoFeatureState(input$foliage)}, new SpruceFoliagePlacer(UniformInt.of(0, 2), ${input$radius}, ${input$trunk_height}), <@twoLayersFeatureSize limit=2 lower_size=0 upper_size=2/>)
.dirt(${toStateProvidertoFeatureState(input$dirt)})<#if field$force_dirt == "TRUE">.forceDirt()</#if>
<#if field$ignore_vines == "TRUE">.ignoreVines()</#if>
.decorators(ImmutableList.of(<#list input_list$decorator as decorator>${decorator}<#sep>,</#list>)).build()