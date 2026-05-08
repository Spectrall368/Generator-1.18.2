private static ItemStack getBlockNBTItemStack(LevelAccessor world, BlockPos pos, String tag) {
	BlockEntity blockEntity = world.getBlockEntity(pos);
	if (blockEntity != null)
		return ItemStack.of(blockEntity.getTileData().getCompound(tag));
	return ItemStack.EMPTY;
}