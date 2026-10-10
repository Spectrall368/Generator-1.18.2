<#if w.getGElementsOfType('tool')?filter(e -> e.toolType.equals('Fishing rod'))?size != 0>
public net.minecraft.world.entity.projectile.FishingHook m_37136_(Lnet/minecraft/world/entity/player/Player;)Z #shouldStopFishing
</#if>

<#if w.hasElementsOfType("dimension")>
public net.minecraft.world.level.levelgen.carver.WorldCarver f_64983_ #replaceableBlocks
public net.minecraft.client.renderer.DimensionSpecialEffects f_108857_ #EFFECTS
</#if>

<#if w.getGElementsOfType("biome")?filter(e -> e.spawnBiome || e.spawnInCaves || e.spawnBiomeNether)?size != 0>
public net.minecraft.world.level.levelgen.SurfaceRules$SequenceRuleSource
public net.minecraft.world.level.levelgen.SurfaceRules$SequenceRuleSource <init>(Ljava/util/List;)V
</#if>

<#if w.hasElementsOfType("feature")>
public net.minecraft.world.level.levelgen.feature.ScatteredOreFeature <init>(Lcom/mojang/serialization/Codec;)V #constructor
public-f net.minecraft.world.level.levelgen.feature.TreeFeature m_142674_(Lnet/minecraft/world/level/levelgen/feature/FeaturePlaceContext;)Z #place
</#if>

<#if w.getGElementsOfType('gamerule')?filter(e -> e.type.equals('Number'))?size != 0>
public net.minecraft.world.level.GameRules$IntegerValue m_46312_(I)Lnet/minecraft/world/level/GameRules$Type; #create
</#if>

<#if w.getGElementsOfType('gamerule')?filter(e -> e.type.equals('Logic'))?size != 0>
public net.minecraft.world.level.GameRules$BooleanValue m_46250_(Z)Lnet/minecraft/world/level/GameRules$Type; #create
</#if>

<#if w.hasElementsOfType("armor")>
public net.minecraft.world.item.ArmorItem f_40380_ # ARMOR_MODIFIER_UUID_PER_SLOT
</#if>

# Start of user code block custom ATs
# End of user code block custom ATs