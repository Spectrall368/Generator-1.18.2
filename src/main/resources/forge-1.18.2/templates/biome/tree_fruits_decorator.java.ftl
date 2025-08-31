<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2023, Pylo, opensource contributors
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
<#include "../mcitems.ftl">
package ${package}.world.features.treedecorators;

public class ${name}FruitDecorator extends CocoaDecorator {
    public static final Codec<${name}FruitDecorator> CODEC = Codec.unit(${name}FruitDecorator::new);
    public static final TreeDecoratorType<?> DECORATOR_TYPE = new TreeDecoratorType<>(CODEC);

    static {
        DECORATOR_TYPE.setRegistryName("${modid}:${registryname}_tree_fruit_decorator");
        ForgeRegistries.TREE_DECORATOR_TYPES.register(DECORATOR_TYPE);
    }

    public ${name}FruitDecorator() {
        super(0.2f);
    }

    @Override protected TreeDecoratorType<?> type() {
        return DECORATOR_TYPE;
    }

    @Override ${mcc.getMethod("net.minecraft.world.level.levelgen.feature.treedecorators.CocoaDecorator", "place", "LevelSimulatedReader", "java.util.function.BiConsumer<BlockPos, BlockState>", "Random", "List", "List")
        .replace("this.probability", "0.2F")
        .replace("Blocks.COCOA.defaultBlockState().setValue(CocoaBlock.AGE,Integer.valueOf(p_161721_.nextInt(3))).setValue(CocoaBlock.FACING,direction)", "oriented(" + mappedBlockToBlockStateCode(data.treeFruits) + ", direction1)")
        .replace("p_161719_", "level")
        .replace("p_161720_", "biConsumer")
        .replace("p_161721_", "random")
        .replace("p_161722_", "blocks")
        .replace("p_161723_", "blocks2")}

    @SuppressWarnings("deprecation") private static BlockState oriented(BlockState blockstate, Direction direction) {
        return switch (direction) {
            case SOUTH -> blockstate.rotate(Rotation.CLOCKWISE_180);
            case EAST -> blockstate.rotate(Rotation.CLOCKWISE_90);
            case WEST -> blockstate.rotate(Rotation.COUNTERCLOCKWISE_90);
            default -> blockstate;
        };
    }
}
<#-- @formatter:on -->
