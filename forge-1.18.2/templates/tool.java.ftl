templates:
  - template: tool.java.ftl
    name: "@SRCROOT/@BASEPACKAGEPATH/item/@NAMEItem.java"
  - template: json/tool.json.ftl
    writer: json
    condition: "renderType #= 0"
    name: "@MODASSETSROOT/models/item/@registryname.json"
  - template: json/handheld_rod.json.ftl
    writer: json
    condition:
      - "renderType #= 0"
      - "toolType %= Fishing rod"
    name: "@MODASSETSROOT/models/item/@registryname.json"
  - template: json/item_cmodel.json.ftl
    writer: json
    condition: "renderType #= 1"
    name: "@MODASSETSROOT/models/item/@registryname.json"
  - template: json/item_cmodel_obj.json.ftl
    writer: json
    condition: "renderType #= 2"
    name: "@MODASSETSROOT/models/item/@registryname.json"
  - template: json/item_model_blocking.json.ftl
    writer: json
    condition: "toolType %= Shield"
    name: "@MODASSETSROOT/models/item/@registryname_0.json"

localizationkeys:
  - key: item.@modid.@registryname
    mapto: name
