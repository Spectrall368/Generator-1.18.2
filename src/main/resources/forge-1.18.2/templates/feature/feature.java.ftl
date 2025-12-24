<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2022, Pylo, opensource contributors
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
package ${package}.world.features;

import net.minecraft.world.level.levelgen.blockpredicates.BlockPredicate;
import net.minecraft.world.level.levelgen.feature.stateproviders.BlockStateProvider;

<#assign configuration = generator.map(featuretype, "features", 1)>
<#assign cond = false>
<#if data.restrictionBiomes?has_content>
	<#list w.filterBrokenReferences(data.restrictionBiomes) as restrictionBiome>
	    <#assign biomeName = fixNamespace(restrictionBiome)>
        <#if biomeName == "#minecraft:is_overworld" || biomeName == "#minecraft:is_nether" || biomeName == "#minecraft:is_end">
			<#assign cond = true>
			 <#break>
		</#if>
	</#list>
</#if>
<#assign placementPattern = r'\$([^$]+)\$'>
<#assign placementMatches = placementcode?matches(placementPattern)>
<#assign placementHardcodedElements = []>
<#list placementMatches as match>
    <#assign placementHardcodedElements = placementHardcodedElements + [match?groups[1]]>
</#list>
<#assign nonHardcodedPlacement = placementcode?replace(placementPattern, "", "r")>
<#assign configurationMatches = configurationcode?matches(placementPattern)>
<#assign configurationHardcodedElements = []>
<#list configurationMatches as match>
    <#assign configurationHardcodedElements = configurationHardcodedElements + [match?groups[1]]>
</#list>
<#assign nonHardcodedConfiguration = configurationcode?replace(placementPattern, "", "r")>
<#assign allHardcodedElements = placementHardcodedElements + configurationHardcodedElements>
<@javacompress>
public class ${name}Feature extends ${generator.map(featuretype, "features")} {
	private static ${name}Feature FEATURE = null;
	public static Holder<ConfiguredFeature<${configuration}, ?>> CONFIGURED_FEATURE = null;
	private static Holder<PlacedFeature> PLACED_FEATURE = null;

	public ${name}Feature() {
		super(${configuration}.CODEC);
	}

	public static Feature<?> feature() {
		FEATURE = new ${name}Feature();
		CONFIGURED_FEATURE = <#if featuretype == "configured_feature_reference">${nonHardcodedConfiguration}<#else>FeatureUtils.register("${modid}:${registryname}", FEATURE, ${nonHardcodedConfiguration})</#if>;
		PLACED_FEATURE = PlacementUtils.register("${modid}:${registryname}", CONFIGURED_FEATURE,
			List.of(<#if data.hasPlacedFeature()>${nonHardcodedPlacement?remove_ending(",")}</#if>));
		return FEATURE;
	}

	public static Holder<PlacedFeature> placedFeature() {
		return PLACED_FEATURE;
	}

	public static final Set<ResourceLocation> GENERATE_BIOMES =
	<#if data.restrictionBiomes?has_content && !cond>
	Set.of(
		<#list w.filterBrokenReferences(data.restrictionBiomes) as restrictionBiome>
		    <#assign expandedBiomes = expandBiomeTag(restrictionBiome)>
		    <#list expandedBiomes as expandedBiome>
			new ResourceLocation("${expandedBiome}")<#sep>,
		    </#list><#sep>,
        </#list>
	)
	<#else>
	null
	</#if>;

    <#if data.restrictionBiomes?has_content && cond>
	private final Set<ResourceKey<Level>> generateDimensions = Set.of(
			<#list w.filterBrokenReferences(data.restrictionBiomes) as restrictionBiome>
	        <#assign biomeName = fixNamespace(restrictionBiome)>
			<#if biomeName == "#minecraft:is_overworld">
				Level.OVERWORLD
			<#elseif biomeName == "#minecraft:is_nether">
				Level.NETHER
			<#else>
				Level.END
			</#if><#sep>,
		</#list>
	);
	</#if>

	<#if data.hasPlacedFeature() && (((data.restrictionBiomes?has_content && cond) || data.hasGenerationConditions()) || (allHardcodedElements?size > 0))>
	@Override public boolean place(FeaturePlaceContext<${configuration}> context) {
		<#-- #4781 - we need to use WorldGenLevel instead of Level, or one can run incompatible procedures in condition -->
		WorldGenLevel world = context.level();
		<#if data.restrictionBiomes?has_content && cond>
		if (!generateDimensions.contains(world.getLevel().dimension()))
			return false;
		</#if>

		<#if hasProcedure(data.generateCondition)>
		int x = context.origin().getX();
		int y = context.origin().getY();
		int z = context.origin().getZ();
		if (!<@procedureOBJToConditionCode data.generateCondition/>)
			return false;
		</#if>

		<#if (allHardcodedElements?size > 0)>
		    <#list allHardcodedElements as element>
		    ${element}
		    </#list>
		</#if>

		return super.place(context);
	}
	</#if>
}</@javacompress>
<#-- @formatter:on -->
<#function expandBiomeTag biomeTag>
    <#local result = []>

    <#if biomeTag?contains("#")>
        <#local biomeName = fixNamespace(biomeTag)>
        <#local tagKey = "BIOMES:" + biomeName?substring(1)>

        <#local tagFound = false>
        <#list w.getWorkspace().getTagElements()?keys as tagElement>
            <#if tagElement.toString().replace("mod:", modid + ":") == tagKey>
                <#local tagFound = true>
                <#local biomeValues = w.getWorkspace().getTagElements().get(tagElement)>
                <#list biomeValues as biomeValue>
                    <#if biomeValue?starts_with("#")>
                        <#local expandedSubValues = expandBiomeTag(biomeValue?replace("mod:", modid + ":"))>
                        <#list expandedSubValues as expandedSubValue>
                            <#local result = result + [expandedSubValue]>
                        </#list>
                    <#else>
                        <#local result = result + [generator.map(biomeValue, "biomes")]>
                    </#if>
                </#list>
                <#break>
            </#if>
        </#list>

        <#if !tagFound>
            <#local result = result + [biomeName?substring(1)]>
        </#if>
    <#else>
        <#local result = result + [biomeTag]>
    </#if>

    <#return result>
</#function>
<#function fixNamespace input>
    <#assign noHash = input?starts_with("#")?then(input?substring(1), input)/>

    <#if noHash?contains(":")>
        <#return input>
    <#else>
        <#assign result = "minecraft:" + noHash />
        <#return input?starts_with("#")?then("#" + result, result)/>
    </#if>
</#function>