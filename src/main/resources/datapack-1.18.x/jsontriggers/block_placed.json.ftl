"${registryname}_${cbi}": {
  "trigger": "minecraft:placed_block",
  "conditions": {
    "item": {
        "items": [
            "${input$block}"
  		]
    }
  }
},