private static double getBlockNBTNumber(LevelAccessor world, BlockPos pos, String tag) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity != null)
		return blockEntity.getTileData().getDouble(tag);
	return -1;
}