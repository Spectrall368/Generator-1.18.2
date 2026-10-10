private static ItemStack extractFromBlockInventory(LevelAccessor world, BlockPos pos, int slotId, int amount, boolean simulate) {
    AtomicReference<ItemStack> result = new AtomicReference<>(ItemStack.EMPTY);
    BlockEntity entity = world.getBlockEntity(pos);
    if (entity != null && slotId >= 0)
		entity.getCapability(CapabilityItemHandler.ITEM_HANDLER_CAPABILITY, null)
		    .ifPresent(capability -> { if (slotId < capability.getSlots()) result.set(capability.extractItem(slotId, amount, simulate)); });

	return result.get();
}