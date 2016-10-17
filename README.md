# Magus Map Maker - Tiled Map Generator Tool - Purebasic

This project is to house my old map generating tools written in Purebasic 3.94.

I currently use Tiled, and do not use this project.

Html Documentation: <a href="http://kennycason.com/code/pb/mmm/help/index.html" target="new">Here</a>

<table><tr>
<td><a href="/screenshots/2nd_layer.JPG"><img width="333px" src="/screenshots/2nd_layer.JPG" /></a></td>
<td><a href="/screenshots/all_layers.JPG"><img width="333px" src="/screenshots/all_layers.JPG" /></a></td>
</tr><tr>
<td><a href="/screenshots/up_to_3rd_layer.JPG"><img width="333px" src="/screenshots//up_to_3rd_layer.JPG" /></a></td>
<td><a href="/screenshots/show_image.JPG"><img width="333px" src="/screenshots/show_image.JPG"/></a></td>
</tr><tr>
<td><a href="/screenshots/map16x16.JPG"><img width="333px" src="/screenshots/map16x16.JPG" /></a></td>
<td width="333px"><a href="/screenshots/sprite_sheet.JPG"><img width="333px" src="/screenshots/sprite_sheet.JPG" /></a></td>
</tr></table>
<table><tr><td><a href="/screenshots/cave.JPG"><img width="900px" src="/screenshots/cave.JPG" /></a></td></tr></table>

Old README
```
About:
  The MagusMapMakers purpose is to make Tile-based mapfiles that can be used with other applications

FileFormat:
  [word] mapWidth
  [word] mapHeight
  [byte] mapData (ex. which tileset to use with this map
  (for the rest of the file length)
  [byte] 1st layer
  [byte] 2nd layer
  [byte] 3rd layer

Keys:
  Arrow keys      - Scroll around map
  Left/Right Click- Select/Draw primary/secondary tile: Zoom in/out in view Map mode
  C & V           - Pan through tiles
  Space           - Draw current tile
  S               - Set tile attributes
  F               - Fill area
  D               - Fill all

****MAPMAKER****

Loading Tiles:
  For the tiles to load they have to follow specific file names. They
  must be in the format of ###.bmp where ### is > 0 and less than 256

Making a Map file:
  1st - load the tiles from the tile directory
  2nd - from the map menu, either load tile map or make new map
  3rd - using the keys draw your map
  4th - dont forget to input which tileset you used into the tileset
        prompt on the right side of the Map Maker
  5th - from the map menu you can now save your map file
  6th - you can also set tile attributes which tell what the tiles actually do
  7th - you can now save the tile attribute file.

Set Attribute:
  The attributes are in the form of 1 byte and correspond to one tile
  0x01234567
  Bits       Attribute       Example
  0          Walkability     0 = not walk/ 1 = walk
  1          Swimmability    0 = not swim/ 1 = swim
  2          NPC passability 0 = NPC pass/ 1 = not NPC pass
  3-7        # from 0 - 31: these indicate a special case

****TILENATOR****
LoadImage - load a tilesheet, deconstruct it into tiles
ConstructTileSheet - choose a directory of tiles then load make them into a tilesheet.  
%-%
```
