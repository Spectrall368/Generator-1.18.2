if (${input$entity}.getCapability(CapabilityItemHandler.ITEM_HANDLER_CAPABILITY, null) instanceof IItemHandler _modHandlerIter) {
	for(int _idx = 0; _idx < _modHandlerIter.getSlots(); _idx++) {
		ItemStack itemstackiterator = _modHandlerIter.getStackInSlot(_idx).copy();
		${statement$foreach}
	}
}