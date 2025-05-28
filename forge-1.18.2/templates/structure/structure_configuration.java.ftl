<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2025, Pylo, opensource contributors
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
package ${package}.world.structures.configurations;

public record StructureConfiguration(Holder<StructureTemplatePool> startPool, int maxDepth, HeightProvider startHeight, Optional<Heightmap.Types> projectStartToHeightmap, int maxDistanceFromCenter) implements FeatureConfiguration {
    public static final Codec<StructureConfiguration> CODEC = RecordCodecBuilder.create(builder -> {
        return builder.group(StructureTemplatePool.CODEC.fieldOf("start_pool").forGetter(config -> {
            return config.startPool;
        }), Codec.intRange(0, 7).fieldOf("size").forGetter(config -> {
            return config.maxDepth;
        }), HeightProvider.CODEC.fieldOf("start_height").forGetter(config -> {
            return config.startHeight;
        }), Heightmap.Types.CODEC.optionalFieldOf("project_start_to_heightmap").forGetter(config -> {
            return config.projectStartToHeightmap;
        }), Codec.intRange(1, 128).fieldOf("max_distance_from_center").forGetter(config -> {
            return config.maxDistanceFromCenter;
        })).apply(builder, StructureConfiguration::new);
        });
    }
<#-- @formatter:on -->