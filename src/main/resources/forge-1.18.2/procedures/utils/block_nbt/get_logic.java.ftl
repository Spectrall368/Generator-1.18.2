private static boolean getBlockNBTLogic(LevelAccessor world, BlockPos pos, String tag) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity != null)
		return blockEntity.getTileData().getBoolean(tag);
	return false;
}