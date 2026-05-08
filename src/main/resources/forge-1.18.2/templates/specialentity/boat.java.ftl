<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2025, Pylo, opensource contributors
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # Additional permission for code generator templates (*.ftl files)
 #
 # As a special exception, you may create a larger work that contains part or
 # all of the MCreator code generator templates (*.ftl files) and distribute
 # that work under terms of your choice, so long as that work isn't itself a
 # template for code generation. Alternatively, if you modify or redistribute
 # the template itself, you may (at your option) remove this special exception,
 # which will cause the template and the resulting code generator output files
 # to be licensed under the GNU General Public License without this special
 # exception.
-->

<#-- @formatter:off -->
package ${package}.entity;

import net.minecraft.network.syncher.EntityDataAccessor;

public class ${JavaModName}Boat extends Boat {
	private static final EntityDataAccessor<Integer> DATA_ID_TYPE = SynchedEntityData.defineId(${JavaModName}Boat.class, EntityDataSerializers.INT);

	public ${JavaModName}Boat(EntityType<? extends Boat> entityType, Level level) {
		super(entityType, level);
	}

    public ${JavaModName}Boat(Level level, double x, double y, double z) {
        this(${JavaModName}Entities.${JavaModName?upper_case}_BOAT.get(), level);
        this.setPos(x, y, z);
        this.xo = x;
        this.yo = y;
        this.zo = z;
    }

	@Override protected Component getTypeName() {
		return new TranslatableComponent("entity.minecraft.boat");
	}

	@Override public Item getDropItem() {
		return switch (getModType()) {
		<#list specialentities as entity>
		    case ${entity.getModElement().getRegistryNameUpper()} -> ${JavaModName}Items.${entity.getModElement().getRegistryNameUpper()}.get();
		</#list>
		    default -> Items.AIR;
		};
	}

	@Override protected void defineSynchedData() {
		super.defineSynchedData();
		this.entityData.define(DATA_ID_TYPE, Type.${specialentities[0].getModElement().getRegistryNameUpper()}.ordinal());
	}

	@Override protected void addAdditionalSaveData(CompoundTag compound) {
		compound.putString("Type", getModType().getName());
	}

	@Override protected void readAdditionalSaveData(CompoundTag compound) {
		if (compound.contains("Type", 8)) {
			setType(Type.byName(compound.getString("Type")));
		}
	}

	public void setType(Type variant) {
		this.entityData.set(DATA_ID_TYPE, variant.ordinal());
	}

	public Type getModType() {
		return Type.byId(this.entityData.get(DATA_ID_TYPE));
	}

	public static enum Type {
        <@javacompress>
            <#list specialentities as entity>
                ${entity.getModElement().getRegistryNameUpper()}(Blocks.OAK_PLANKS, "${entity.getModElement().getRegistryName()}")<#sep>,
            </#list>;
        </@javacompress>

        private final String name;
        private final Block planks;

        private Type(Block block, String name) {
            this.name = name;
            this.planks = block;
        }

        public String getName() {
            return name;
        }

        public Block getPlanks() {
            return planks;
        }

        public String toString() {
            return name;
        }

        public static ${JavaModName}Boat.Type byId(int id) {
            Type[] type = values();
            if (id < 0 || id >= type.length)
                id = 0;

            return type[id];
        }

        public static ${JavaModName}Boat.Type byName(String name) {
            Type[] type = values();

            for(int i = 0; i < type.length; ++i) {
                if (type[i].getName().equals(name))
                    return type[i];
            }

            return type[0];
        }
	}
}
<#-- @formatter:on -->