private static String executeCommandGetResult(LevelAccessor world, Vec3 pos, String command) {
	StringBuilder result = new StringBuilder();
	if (world instanceof ServerLevel level) {
		CommandSource dataConsumer = new CommandSource() {
			@Override public void sendMessage(Component message, UUID uuid) {
				result.append(message.getString());
			}

			@Override public boolean acceptsSuccess() {
				return true;
			}

			@Override public boolean acceptsFailure() {
				return true;
			}

			@Override public boolean shouldInformAdmins() {
				return false;
			}
		};
		level.getServer().getCommands().performCommand(new CommandSourceStack(dataConsumer, pos, Vec2.ZERO, level, 4, "", new TextComponent(""), level.getServer(), null), command);
	}
	return result.toString();
}