<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2021, Pylo, opensource contributors
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # Additional permission for code generator templates (*.ftl files)
 #
 # As a special exception, you may create a larger work that contains part or
 # all of the MCreator code generator templates (*.ftl files) and distribute
 # that work under terms of your choice, so long as that work isn't itself a
 # template for code generation. Alternatively, if you modify or redistribute
 # the template itself, you may (at your option) remove this special exception,
 # which will cause the template and the resulting code generator output files
 # to be licensed under the GNU General Public License without this special
 # exception.
-->

<#-- @formatter:off -->
<#include "../procedures.java.ftl">
<#include "../mcitems.ftl">
package ${package}.world.features.plants;
<#assign cond = false>
<#if data.restrictionBiomes?has_content>
	<#list w.filterBrokenReferences(data.restrictionBiomes) as restrictionBiome>
		<#if restrictionBiome == "#minecraft:is_overworld" || restrictionBiome == "#minecraft:is_end">
			<#assign cond = true>
			 <#break>
		</#if>
		<#break>
	</#list>
</#if>

import net.minecraft.world.level.levelgen.blockpredicates.BlockPredicate;
import net.minecraft.world.level.levelgen.feature.stateproviders.BlockStateProvider;

public class ${name}Feature extends RandomPatchFeature {

	public static ${name}Feature FEATURE = null;
	public static Holder<ConfiguredFeature<RandomPatchConfiguration, ?>> CONFIGURED_FEATURE = null;
	public static Holder<PlacedFeature> PLACED_FEATURE = null;

	public static Feature<?> feature() {
		FEATURE = new ${name}Feature();
		CONFIGURED_FEATURE = FeatureUtils.register("${modid}:${registryname}", FEATURE,
			<#if data.plantType == "growapable">
				FeatureUtils.simpleRandomPatchConfiguration(${data.patchSize}, PlacementUtils.filtered(
								Feature.BLOCK_COLUMN, BlockColumnConfiguration.simple(BiasedToBottomInt.of(2, 4),
										BlockStateProvider.simple(${JavaModName}Blocks.${data.getModElement().getRegistryNameUpper()}.get().defaultBlockState())),
						BlockPredicate.allOf(BlockPredicate.ONLY_IN_AIR_PREDICATE,
								BlockPredicate.wouldSurvive(${JavaModName}Blocks.${data.getModElement().getRegistryNameUpper()}.get().defaultBlockState(), BlockPos.ZERO))
				))
			<#else>
				FeatureUtils.simplePatchConfiguration(Feature.SIMPLE_BLOCK,
						new SimpleBlockConfiguration(BlockStateProvider.simple(${JavaModName}Blocks.${data.getModElement().getRegistryNameUpper()}.get().defaultBlockState())),
						List.of(), ${data.patchSize})
			</#if>
		);
		PLACED_FEATURE = PlacementUtils.register("${modid}:${registryname}", CONFIGURED_FEATURE,
				List.of(
			CountPlacement.of(${data.frequencyOnChunks}),
			<#if ((data.plantType == "normal" || data.plantType == "double") && data.generationType == "Flower") || data.plantType == "growapable">
			RarityFilter.onAverageOnceEvery(32),
			</#if>
			InSquarePlacement.spread(),
			<#if data.generateAtAnyHeight>
				PlacementUtils.FULL_RANGE
			<#else>
			PlacementUtils.HEIGHTMAP<#if ((data.plantType == "normal" || data.plantType == "double") && data.generationType == "Grass") || data.plantType == "growapable">_WORLD_SURFACE</#if>
			</#if>,
			 BiomeFilter.biome()
		));
		return FEATURE;
	}

	public static Holder<PlacedFeature> placedFeature() {
		return PLACED_FEATURE;
	}

	public static final Set<ResourceLocation> GENERATE_BIOMES =
	<#if data.restrictionBiomes?has_content && !cond>
	Set.of(
		<#list w.filterBrokenReferences(data.restrictionBiomes) as restrictionBiome>
			new ResourceLocation("${restrictionBiome?replace("#", "")}")<#sep>,
		</#list>
	);
	<#else>
	null;
	</#if>

    <#if data.restrictionBiomes?has_content && cond>
	private final Set<ResourceKey<Level>> generate_dimensions = Set.of(
		<#list w.filterBrokenReferences(data.restrictionBiomes) as restrictionBiome>
			<#if restrictionBiome == "#minecraft:is_overworld">
				Level.OVERWORLD
			<#elseif restrictionBiome == "#minecraft:is_end">
				Level.END
			</#if><#sep>,
		</#list>
	);
	</#if>

	public ${name}Feature() {
		super(RandomPatchConfiguration.CODEC);
	}

	public boolean place(FeaturePlaceContext<RandomPatchConfiguration> context) {
		WorldGenLevel world = context.level();
		<#if data.restrictionBiomes?has_content && cond>
		if (!generate_dimensions.contains(world.getLevel().dimension()))
			return false;
		</#if>

		return super.place(context);
	}
}

<#-- @formatter:on -->
