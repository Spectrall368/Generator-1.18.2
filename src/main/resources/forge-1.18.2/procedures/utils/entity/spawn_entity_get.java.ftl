private static Entity spawnEntity(Entity entity, BlockPos blockpos, LevelAccessor world) {
    entity.setPos(blockpos.getX(), blockpos.getY(), blockpos.getZ());

    if (entity instanceof Mob mob)
        mob.finalizeSpawn((ServerLevel) world, world.getCurrentDifficultyAt(entity.blockPosition()), MobSpawnType.MOB_SUMMONED, null, null);

    world.addFreshEntity(entity);
    return entity;
}