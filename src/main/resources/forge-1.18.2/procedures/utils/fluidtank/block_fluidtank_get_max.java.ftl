private static int getFluidTankCapacity(LevelAccessor level, BlockPos pos, int tank, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, direction)
		    .ifPresent(capability -> result.set(capability.getTankCapacity(tank)));

	return result.get();
}