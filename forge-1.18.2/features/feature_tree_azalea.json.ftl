<#include "mcitems.ftl">
<#include "trees.ftl">
new TreeConfiguration.TreeConfigurationBuilder(${toStateProvidertoFeatureState(input$trunk)}, new BendingTrunkPlacer(
${field$base_height}, ${field$height_variation_a}, ${field$height_variation_b}, ${field$min_height_for_leaves}, ${input$bend_length}),
${toStateProvidertoFeatureState(input$foliage)}, <@randomSpreadFoliagePlacer radius=3 offset=0 foliage_height=2 density=field$foliage_density/>,
<@twoLayersFeatureSize limit=1 lower_size=0 upper_size=1/>).dirt(${toStateProvidertoFeatureState(input$dirt)})<#if field$force_dirt == "TRUE">.forceDirt()</#if>
<#if field$ignore_vines == "TRUE">.ignoreVines()</#if>.decorators(ImmutableList.of(<#list input_list$decorator as decorator>${decorator}<#sep>,</#list>)).build()