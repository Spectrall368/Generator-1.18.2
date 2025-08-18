package net.mcreator.packloader;

import net.minecraftforge.fml.loading.FMLPaths;
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.event.AddPackFindersEvent;

import net.minecraft.server.packs.repository.PackSource;
import net.minecraft.server.packs.repository.FolderRepositorySource;

import java.nio.file.Path;

@Mod(PackLoaderMod.MODID) public class PackLoaderMod {

	public static final String MODID = "packloader";

	public PackLoaderMod() {
		FMLJavaModLoadingContext.get().getModEventBus().addListener(this::addPacks);
	}

	public void addPacks(AddPackFindersEvent event) {
		event.addRepositorySource(new FolderRepositorySource(FMLPaths.getOrCreateGameRelativePath(Path.of("datapacks"), "datapacks"), PackSource.DEFAULT));
	}
}
