private static int receiveEnergySimulate(LevelAccessor level, BlockPos pos, int amount, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(CapabilityEnergy.ENERGY, direction)
		    .ifPresent(capability -> result.set(capability.receiveEnergy(amount, true)));

	return result.get();
}