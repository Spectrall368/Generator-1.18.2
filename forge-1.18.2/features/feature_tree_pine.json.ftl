<#include "mcitems.ftl">
<#include "trees.ftl">
new TreeConfiguration.TreeConfigurationBuilder(${mappedBlockToBlockStateProvider(input$trunk)?contains(".setValue")?then(mappedBlockToBlockStateProvider(input$trunk)?substring(0,mappedBlockToBlockStateProvider(input$trunk)?last_index_of(".defaultBlockState()"))+mappedBlockToBlockStateProvider(input$trunk)?substring(mappedBlockToBlockStateProvider(input$trunk)?last_index_of(".defaultBlockState()")+20),mappedBlockToBlockStateProvider(input$trunk))},
<#if field$type == "pine">
<@simpleTrunkPlacer "minecraft:straight_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
<#else>
<@simpleTrunkPlacer "minecraft:giant_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
</#if>, ${mappedBlockToBlockStateProvider(input$foliage)?contains(".setValue")?then(mappedBlockToBlockStateProvider(input$foliage)?substring(0,mappedBlockToBlockStateProvider(input$foliage)?last_index_of(".defaultBlockState()"))+mappedBlockToBlockStateProvider(input$foliage)?substring(mappedBlockToBlockStateProvider(input$foliage)?last_index_of(".defaultBlockState()")+20),mappedBlockToBlockStateProvider(input$foliage))},
<#if field$type == "pine">
new PineFoliagePlacer(ConstantInt.of(1), ConstantInt.of(1), ${input$foliage_height}), <@twoLayersFeatureSize limit=2 lower_size=0 upper_size=2/>
<#else>
new MegaPineFoliagePlacer(ConstantInt.of(0), ConstantInt.of(0), ${input$foliage_height}), <@twoLayersFeatureSize limit=1 lower_size=1 upper_size=2/>
</#if>).dirt(${mappedBlockToBlockStateProvider(input$dirt)?contains(".setValue")?then(mappedBlockToBlockStateProvider(input$dirt)?substring(0,mappedBlockToBlockStateProvider(input$dirt)?last_index_of(".defaultBlockState()"))+mappedBlockToBlockStateProvider(input$dirt)?substring(mappedBlockToBlockStateProvider(input$dirt)?last_index_of(".defaultBlockState()")+20),mappedBlockToBlockStateProvider(input$dirt))})<#if field$force_dirt == "TRUE">.forceDirt()</#if>
<#if field$ignore_vines == "TRUE">.ignoreVines()</#if>.decorators(ImmutableList.of(<#list input_list$decorator as decorator>${decorator}<#sep>,</#list>)).build()