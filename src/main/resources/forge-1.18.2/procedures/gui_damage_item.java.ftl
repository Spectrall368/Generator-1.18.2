if(${input$entity} instanceof Player _player && _player.containerMenu instanceof ${JavaModName}Menus.MenuAccessor _menu) {
	ItemStack stack = _menu.getSlots().get(${opt.toInt(input$slotid)}).getItem();
	if(stack != null) {
		if(stack.hurt(${opt.toInt(input$amount)}, new Random(), null)) {
			stack.shrink(1);
			stack.setDamageValue(0);
		}
		_player.containerMenu.broadcastChanges();
	}
}