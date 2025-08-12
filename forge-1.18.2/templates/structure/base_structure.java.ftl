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
package ${package}.world.structures;

public class ${JavaModName}StructureBase extends StructureFeature<StructureConfiguration> {
    public ${JavaModName}StructureBase() {
        super(StructureConfiguration.CODEC, ${JavaModName}StructureBase::createPiecesGenerator);
    }

    @Override
    public GenerationStep.Decoration step() {
        return null;
    }

    public static Optional<PieceGenerator<StructureConfiguration>> createPiecesGenerator(PieceGeneratorSupplier.Context<StructureConfiguration> context) {
        int topLandY = context.config().startHeight().sample(new Random(), new WorldGenerationContext(context.chunkGenerator(), context.heightAccessor()));
        BlockPos blockpos = context.chunkPos().getMiddleBlockPosition(0).atY(topLandY);

        if (context.config().projectStartToHeightmap().isPresent()) {
            topLandY = context.chunkGenerator().getFirstFreeHeight(blockpos.getX(), blockpos.getZ(), context.config().projectStartToHeightmap().get(), context.heightAccessor());
            blockpos = blockpos.atY(blockpos.getY() + topLandY);
        }

        Pools.bootstrap();

        JigsawConfiguration jigsawConfig = new JigsawConfiguration(context.config().startPool(), context.config().maxDepth());

        PieceGeneratorSupplier.Context<JigsawConfiguration> jigsawContext = new PieceGeneratorSupplier.Context<>(
                context.chunkGenerator(), context.biomeSource(), context.seed(), context.chunkPos(), jigsawConfig, context.heightAccessor(), context.validBiome(),
                context.structureManager(), context.registryAccess());

        Optional<PieceGenerator<JigsawConfiguration>> jigsawResult = JigsawPlacement.addPieces(jigsawContext, PoolElementStructurePiece::new, blockpos, false, false);

        return (Optional<PieceGenerator<StructureConfiguration>>) (Optional<?>) jigsawResult;
    }
}