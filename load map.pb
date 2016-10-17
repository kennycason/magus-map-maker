  fileM$ = OpenFileRequester("Load Map file","","LVL(*.lvl)|*.lvl|MDAT(*.mdat)|*.mdat|ALL(*.*)|*.*",0)
  OpenConsole()
  If ReadFile(0,fileM$)
    area_width = ReadWord(); first line width x height
    area_height = ReadWord(); first line width y height
    
    mapType = ReadByte() ; misc data about the map
    Dim mapBottom.b(area_width, area_height)
    Dim map.b(area_width, area_height)
    Dim mapTop.b(area_width, area_height)
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        mapBottom(tile_x,tile_y) = ReadByte() & $FF
        map(tile_x,tile_y) = ReadByte() & $FF
        mapTop(tile_x,tile_y) = ReadByte() & $FF
      Next
    Next
    CloseFile(0)
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        Print(Str(mapBottom(tile_x,tile_y))+" ")
      Next
      PrintN("")
    Next  
    
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        Print(Str(map(tile_x,tile_y))+" ")
      Next
      PrintN("")
    Next  
    
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        Print(Str(mapTop(tile_x,tile_y))+" ")
      Next
      PrintN("")
    Next  
    
    exit = 0
    
    Repeat 
    
    
    Until exit = 1
  Else
    MessageRequester(title$, "Tile map could not be loaded")
  EndIf 
; IDE Options = PureBasic v3.94 (Windows - x86)
; Executable = loadOneMapLayer.exe