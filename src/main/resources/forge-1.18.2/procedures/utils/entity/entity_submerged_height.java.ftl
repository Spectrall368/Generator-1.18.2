private static double getEntitySubmergedHeight(Entity entity) {
	for (TagKey<Fluid> fluidType : Registry.FLUID.getTagNames().toList()) {
		if (entity.level.getFluidState(entity.blockPosition()).is(fluidType))
			return entity.getFluidHeight(fluidType);
	}
	return 0;
}