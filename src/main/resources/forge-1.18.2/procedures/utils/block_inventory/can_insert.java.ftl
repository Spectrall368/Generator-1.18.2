public static boolean canInsertInBlockInventory(LevelAccessor world, BlockPos pos, int slotId, int amount, ItemStack itemstack) {
    AtomicReference<Boolean> result = new AtomicReference<>(false);
    BlockEntity entity = world.getBlockEntity(pos);
    if (entity != null && slotId >= 0)
		entity.getCapability(CapabilityItemHandler.ITEM_HANDLER_CAPABILITY, null)
		    .ifPresent(capability -> { if(slotId < capability.getSlots()) result.set(capability.isItemValid(slotId, itemstack));});

	return result.get();
}