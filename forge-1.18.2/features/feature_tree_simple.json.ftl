<#include "mcitems.ftl">
<#include "trees.ftl">
new TreeConfiguration.TreeConfigurationBuilder(${mappedBlockToBlockStateProvider(input$trunk)?contains("FeatureUtils")?then(mappedBlockToBlockStateProvider(input$trunk)?substring(0,mappedBlockToBlockStateProvider(input$trunk)?last_index_of(".defaultBlockState()"))+mappedBlockToBlockStateProvider(input$trunk)?substring(mappedBlockToBlockStateProvider(input$trunk)?last_index_of(".defaultBlockState()")+20),mappedBlockToBlockStateProvider(input$trunk))},
<#if field$type == "oak">
<@simpleTrunkPlacer "minecraft:straight_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
<#elseif field$type == "acacia">
<@simpleTrunkPlacer "minecraft:forking_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
<#elseif field$type == "dark oak">
<@simpleTrunkPlacer "minecraft:dark_oak_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
<#elseif field$type == "jungle bush">
<@simpleTrunkPlacer "minecraft:straight_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
<#elseif field$type == "mega jungle">
<@simpleTrunkPlacer "minecraft:mega_jungle_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
<#elseif field$type == "fancy oak">
<@simpleTrunkPlacer "minecraft:fancy_trunk_placer" field$base_height field$height_variation_a field$height_variation_b/>
</#if>, ${mappedBlockToBlockStateProvider(input$foliage)?contains("FeatureUtils")?then(mappedBlockToBlockStateProvider(input$foliage)?substring(0,mappedBlockToBlockStateProvider(input$foliage)?last_index_of(".defaultBlockState()"))+mappedBlockToBlockStateProvider(input$foliage)?substring(mappedBlockToBlockStateProvider(input$foliage)?last_index_of(".defaultBlockState()")+20),mappedBlockToBlockStateProvider(input$foliage))},
<#if field$type == "oak">
<@simpleFoliagePlacer type="minecraft:blob_foliage_placer" radius=2 offset=0 height=3/>, <@twoLayersFeatureSize limit=1 lower_size=0 upper_size=1/>
<#elseif field$type == "acacia">
<@simpleFoliagePlacer type="minecraft:acacia_foliage_placer" radius=2 offset=0/>, <@twoLayersFeatureSize limit=1 lower_size=0 upper_size=2/>
<#elseif field$type == "dark oak">
<@simpleFoliagePlacer type="minecraft:dark_oak_foliage_placer" radius=0 offset=0/>, <@threeLayersFeatureSize limit=1 upper_limit=1 lower_size=0 middle_size=1 upper_size=2/>
<#elseif field$type == "jungle bush">
<@simpleFoliagePlacer type="minecraft:bush_foliage_placer" radius=2 offset=1 height=2/>, <@twoLayersFeatureSize limit=0 lower_size=0 upper_size=0/>
<#elseif field$type == "mega jungle">
<@simpleFoliagePlacer type="minecraft:jungle_foliage_placer" radius=2 offset=0 height=2/>, <@twoLayersFeatureSize limit=1 lower_size=1 upper_size=2/>
<#elseif field$type == "fancy oak">
<@simpleFoliagePlacer type="minecraft:fancy_foliage_placer" radius=2 offset=4 height=4/>, <@twoLayersFeatureSize limit=0 lower_size=0 upper_size=0 min_clipped_height=4/>
</#if>).dirt(${mappedBlockToBlockStateProvider(input$dirt)?contains("FeatureUtils")?then(mappedBlockToBlockStateProvider(input$dirt)?substring(0,mappedBlockToBlockStateProvider(input$dirt)?last_index_of(".defaultBlockState()"))+mappedBlockToBlockStateProvider(input$dirt)?substring(mappedBlockToBlockStateProvider(input$dirt)?last_index_of(".defaultBlockState()")+20),mappedBlockToBlockStateProvider(input$dirt))})<#if field$force_dirt == "TRUE">.forceDirt()</#if>
<#if field$ignore_vines == "TRUE">.ignoreVines()</#if>
.decorators(ImmutableList.of(<#list input_list$decorator as decorator>${decorator}<#sep>,</#list>)).build()