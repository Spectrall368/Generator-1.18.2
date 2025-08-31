public static int getEnergyStored(LevelAccessor level, BlockPos pos, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(CapabilityEnergy.ENERGY, direction)
		    .ifPresent(capability -> result.set(capability.getEnergyStored()));

	return result.get();
}