/*@ItemStack*/(${input$entity} instanceof Player _plrSlotItem && _plrSlotItem.containerMenu instanceof Supplier _splr && _splr.get() instanceof Map _slt ?
	((Slot) _slt.get(${opt.toInt(input$slotid)})).getItem() : ItemStack.EMPTY)
