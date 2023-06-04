import net.minecraft.entity.merchant.villager.VillagerProfession;
import net.minecraft.util.SoundEvent;
import net.minecraft.world.poi.PointOfInterestType; // changed package
import net.minecraftforge.event.RegistryEvent; // added import
import net.minecraftforge.eventbus.api.SubscribeEvent; // added import
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.IRegistryDelegate.Holder; // changed slash to dot

@Mod.EventBusSubscriber(bus = Mod.EventBusSubscriber.Bus.MOD) public class TestModVillagerProfessions {

	private static final Map<String, ProfessionPoiType> POI_TYPES = new HashMap<>();

	public static final DeferredRegister<VillagerProfession> PROFESSIONS = DeferredRegister.create(ForgeRegistries.PROFESSIONS, TestMod.MODID); // changed VILLAGER_PROFESSIONS to PROFESSIONS

	// ... other code ...

	@SubscribeEvent // added annotation
	public static void registerProfessionPointsOfInterest(RegistryEvent.Register<PointOfInterestType> event) { // changed parameter type
		event.register(ForgeRegistries.Keys.POI_TYPES, registerHelper -> {
			for (Map.Entry<String, ProfessionPoiType> entry : POI_TYPES.entrySet()) {
				Block block = entry.getValue().block.get();
				String name = entry.getKey();

				Optional<PointOfInterestType> existingCheck = PointOfInterestType.forState(block.defaultBlockState());
				if (existingCheck.isPresent()) {
					TestMod.LOGGER.error("Skipping villager profession " + name + " that uses POI block " + block + " that is already in use by " + existingCheck);
					continue;
				}

				PointOfInterestType poiType = PointOfInterestType.register(name, ImmutableSet.copyOf(block.getStateDefinition().getPossibleStates()), 1, 1); // changed constructor to register method
				registerHelper.register(name, poiType);
				entry.getValue().poiType = ForgeRegistries.POI_TYPES.getHolder(poiType).get();
			}
		});
	}

	private static class ProfessionPoiType {

		final Supplier<Block> block;
		Holder<PointOfInterestType> poiType;

		ProfessionPoiType(Supplier<Block> block, Holder<PointOfInterestType> poiType) {
			this.block = block;
			this.poiType = poiType;
		}

	}

}
