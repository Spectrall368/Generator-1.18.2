private static boolean hasEntityInInventory(Entity entity, ItemStack itemstack) {
	if (entity instanceof Player player) {
	    Inventory inventory = player.getInventory();
	    List<NonNullList<ItemStack>> compartments = com.google.common.collect.ImmutableList.of(inventory.items, inventory.armor, inventory.offhand);
        for (List<ItemStack> list : compartments) {
            for (ItemStack itemstack2 : list) {
                if (itemstack.sameItem(itemstack2)) {
                    return true;
                }
            }
        }
    }
	return false;
}