<#assign spawnBiomes = w.filterBrokenReferences(data.restrictionBiomes)>
{
  "type": "${modid}:${registryname}",
  "config": {
    "start_pool": "${modid}:${registryname}",
    "size": ${[data.size, 7]?min},
    "start_height": {
        <#if data.useStartHeight>
        "type": "minecraft:${data.startHeightProviderType?lower_case}",
        "min_inclusive": {
          "absolute": ${data.startHeightMin}
        },
        "max_inclusive": {
          "absolute": ${data.startHeightMax}
        }
        <#else>
        "absolute": 0
        </#if>
    },
  <#if !data.useStartHeight>
  "project_start_to_heightmap": "${data.surfaceDetectionType}",
  </#if>
  "max_distance_from_center": ${data.maxDistanceFromCenter}
  },
  "adapt_noise": <#if data.terrainAdaptation == "none" || data.terrainAdaptation == "bury" || data.terrainAdaptation == "encapsulate">false<#else>true</#if>,
  "spawn_overrides": {},
  <#if spawnBiomes?size == 1>
  "biomes": "${spawnBiomes?first?replace("#minecraft:is_overworld", "#forge:is_overworld")?replace("#minecraft:is_end", "#forge:is_end")}"
  <#else>
  "biomes": [
    <#list spawnBiomes as spawnBiome>"${spawnBiome}"<#sep>,</#list>
  ]
  </#if>
}
