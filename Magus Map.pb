; MagusMapMaker v2.0
; Programmed by: Kenneth Cason


OnErrorResume()
If InitKeyboard() And InitMouse() And InitSprite()
Else
  End
EndIf
AdvancedGadgetEvents(#True) 

UseJPEGImageDecoder()
UsePNGImageDecoder()
UseTGAImageDecoder()
UseTIFFImageDecoder()

#GADGET_Button = 50
#GADGET_ScrollArea = 78
#GADGET_ScrollImage = 79
#GADGET_ToolBarImage = 80
#GADGET_CheckBox = 100
#GADGET_Editor = 120
#GADGET_text = 150
#SHTCUT_Event = 190
#GADGET_TileImage = 218
#Gadget_Image = 220


#GADGET_TilenatorImage = #GADGET_Image+300

DataSection 
 cursor: IncludeBinary "bmp\cursor.ico"
 null: IncludeBinary "bmp\null.bmp"
 walk: IncludeBinary "bmp\walk.ico"
 water: IncludeBinary "bmp\water.ico"
 npc: IncludeBinary "bmp\npc.ico"
 0: IncludeBinary "bmp\0.ico"
 1: IncludeBinary "bmp\1.ico"
 2: IncludeBinary "bmp\2.ico"
 3: IncludeBinary "bmp\3.ico"
 4: IncludeBinary "bmp\4.ico"
 5: IncludeBinary "bmp\5.ico"
 6: IncludeBinary "bmp\6.ico"
 7: IncludeBinary "bmp\7.ico"
 8: IncludeBinary "bmp\8.ico"
 9: IncludeBinary "bmp\9.ico"
 10: IncludeBinary "bmp\10.ico"
 11: IncludeBinary "bmp\11.ico"
 12: IncludeBinary "bmp\12.ico"
 13: IncludeBinary "bmp\13.ico"
 14: IncludeBinary "bmp\14.ico"
 15: IncludeBinary "bmp\15.ico"
 16: IncludeBinary "bmp\16.ico"
 17: IncludeBinary "bmp\17.ico"
 18: IncludeBinary "bmp\18.ico"
 19: IncludeBinary "bmp\19.ico"
 20: IncludeBinary "bmp\20.ico"
 21: IncludeBinary "bmp\21.ico"
 22: IncludeBinary "bmp\22.ico"
 23: IncludeBinary "bmp\23.ico"
 24: IncludeBinary "bmp\24.ico"
 25: IncludeBinary "bmp\25.ico"
 26: IncludeBinary "bmp\26.ico"
 27: IncludeBinary "bmp\27.ico"
 28: IncludeBinary "bmp\28.ico"
 29: IncludeBinary "bmp\29.ico"
 30: IncludeBinary "bmp\30.ico"
 31: IncludeBinary "bmp\31.ico" 
 blank: IncludeBinary "bmp\blank.bmp" 
EndDataSection

CatchImage(0,?null)
CatchImage(256,?cursor)
CatchImage(257,?walk)
CatchImage(258,?water)
CatchImage(259,?npc)
CatchImage(260,?0)
CatchImage(261,?1)
CatchImage(262,?2)
CatchImage(263,?3)
CatchImage(264,?4)
CatchImage(265,?5)
CatchImage(266,?6)
CatchImage(267,?7)
CatchImage(268,?8)
CatchImage(269,?9)
CatchImage(270,?10)
CatchImage(271,?11)
CatchImage(272,?12)
CatchImage(273,?13)
CatchImage(274,?14)
CatchImage(275,?15)
CatchImage(276,?16)
CatchImage(277,?17)
CatchImage(278,?18)
CatchImage(279,?19)
CatchImage(280,?20)
CatchImage(281,?21)
CatchImage(282,?22)
CatchImage(283,?23)
CatchImage(284,?24)
CatchImage(285,?25)
CatchImage(286,?26)
CatchImage(287,?27)
CatchImage(288,?28)
CatchImage(289,?29)
CatchImage(290,?30)
CatchImage(291,?31)
CatchImage(292,?blank)
maxAttributeImage = 291
minAttributeImage = 257
currentAttributeImage = 257

Procedure.w getPreviousImage(image.w)
  Global maxImage 
  Repeat 
    image - 1
    If image < 0  
       image = maxImage
    ElseIf IsImage(image)
       Break
    EndIf
  ForEver
ProcedureReturn image
EndProcedure

Procedure.w getNextImage(image.w)
  Global maxImage 
  Repeat 
    image + 1
    If image > maxImage 
       image = 0
       Break
    ElseIf IsImage(image)
       Break
    EndIf
  ForEver
ProcedureReturn image
EndProcedure

Procedure.w getPreviousAttributeImage(image.w)
  Global maxAttributeImage 
  Global minAttributeImage
  Repeat 
    image - 1
    If image < 0
       image = maxAttributeImage
    ElseIf IsImage(image)
       Break
    EndIf
  ForEver
ProcedureReturn image
EndProcedure

Procedure.w getNextAttributeImage(image.w)
  Global maxAttributeImage 
  Global minAttributeImage
  Repeat 
    image + 1
    If image > maxAttributeImage 
       image = minAttributeImage
       Break
    ElseIf IsImage(image)
       Break
    EndIf
  ForEver
ProcedureReturn image
EndProcedure



Enumeration 
  ;map
  #File = 0
  #newMap
  #loadMapFile
  #saveMapFile
  #saveMap
  #exit
  ;view
  #showBottomMap
  #showMiddleMap
  #showTopMap
  #showAttributeMap
  #showMap
  #showConsole
  ;tools
  #fillAll
  #setAttribute
  #tilenator
  ;tiles
  #loadBMP
  #loadPNG
  #loadJPEG
  #loadTIFF
  #loadTGA
  ;help
  #help
  #info
  #window2
  ;extraData
  #EditLayerData
  #EditExtraData
EndEnumeration 

Dim mapBottom.b(0,0)
Dim map.b(0,0) 
Dim mapTop.b(0,0) 
Dim mapData.b(0,0)
Dim extraData.b(0)
extraDataLength = 0
red = 0
green = 0
blue = 0
image = 0
image2= 1
maxWidth = 500
maxHeight = 500
WindowX = 640
WindowY = 480
showBottomMap = 1
showMiddleMap = 1
showTopMap = 1
showAttributeMap = 1
showOnlySpecial = 0
showConsoleMap = 0

area_width = 0 ; width
area_height = 0 ; height
matX = 0
matY = 0
imageWidth = 32 ; default
imageHeight = 32

cam_x = (matX-10)*-imageWidth
cam_y = (maty-7)*-imageHeight
scopeX = 9
scopeY = 8
titles$ = "Magus Map Maker"

pattern$ = "Bitmap(*.bmp)|*.bmp|JPEG(*.jpg,*.jpeg)|*.jpeg;*.jpg|PNG(*.png)|*.png|TGA(.tga)|*.tga|TIFF(*.tiff)|*.tiff|All Images(*.*)|*.bmp;*.jpg;*.jpeg;*.png;*.tga;*.tiff"

win = OpenWindow(0, 100, 100, WindowX+147, WindowY, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "Magus Map Maker v2.0")

Gosub init

;- MAIN
main:
Repeat

      If IsWindow(0)
        UseWindow(0)
        If area_width > 0 And area_height > 0
          Gosub drawTiles
        EndIf 

      EndIf 
       
      Gosub checkForGadgets
      
      If showConsoleMap = 1
          Gosub ConsoleMap
      EndIf
        
      mX = WindowMouseX()
      mY = WindowMouseY()

Until eventID = #PB_Event_CloseWindow 

End 



;- init
init:
If CreateGadgetList(WindowID())
  If IsMenu(0) = 0 
   If CreateMenu(0, WindowID())
      MenuTitle("Map")
        MenuItem(#newMap, "New Map")
        MenuItem(#loadMapFile, "Load Map file")
        MenuItem(#saveMapFile, "Save Map file")
        MenuItem(#saveMap, "Save the Map as one Image")
        MenuBar()
        MenuItem(#exit, "Exit")
      
      MenuTitle("View")
        MenuItem(#showBottomMap, "Toggle Bottom Map on/off")
        MenuItem(#showMiddleMap, "Toggle Middle Map on/off")
        MenuItem(#showTopMap, "Toggle Top Map on/off")
        MenuItem(#showAttributeMap, "Toggle Tile Attribute Map on/off")
        MenuItem(#showConsole, "Toggle Console Map on/off")
        MenuItem(#showMap, "Display the Map as one Image")
        
        
      MenuTitle("Tools")
        MenuItem(#fillAll, "FillAll")
        MenuItem(#setAttribute, "Set Tile Attribute")
        
          
      MenuTitle("Tiles")
        MenuItem(#loadBMP, "Load BMP Tiles")
        MenuItem(#loadPNG, "Load PNG Tiles")
        MenuItem(#loadJPEG, "Load JPEG Tiles")
        MenuItem(#loadTIFF, "Load TIFF Tiles")
        MenuItem(#loadTGA, "Load TGA Tiles")
        
      MenuTitle("Tilenator")  
        MenuItem(#tilenator, "Tilenator")
        
      MenuTitle("Map FileData")
        MenuItem(#EditLayerData, "Edit Layer number")
        MenuItem(#EditExtraData, "Edit ExtraData")
       
      MenuTitle("Help")
        MenuItem(#help,"View Readme")
        MenuItem(#info,"Info")
   EndIf 
  EndIf 

    exit = 0
    l = 645
    k = 0
    Width = 140
    Height = 20
    
      AddKeyboardShortcut(0, #PB_Shortcut_Space, #SHTCUT_Event) 
      AddKeyboardShortcut(0, #PB_Shortcut_Up, #SHTCUT_Event+1) 
      AddKeyboardShortcut(0, #PB_Shortcut_Down, #SHTCUT_Event+2) 
      AddKeyboardShortcut(0, #PB_Shortcut_Left, #SHTCUT_Event+3)     
      AddKeyboardShortcut(0, #PB_Shortcut_Right, #SHTCUT_Event+4)     
      
      AddKeyboardShortcut(0, #PB_Shortcut_C, #SHTCUT_Event+5)     
      AddKeyboardShortcut(0, #PB_Shortcut_V, #SHTCUT_Event+6) 
      AddKeyboardShortcut(0, #PB_Shortcut_F, #SHTCUT_Event+7)
      AddKeyboardShortcut(0, #PB_Shortcut_S, #SHTCUT_Event+8)
      AddKeyboardShortcut(0, #PB_Shortcut_Z, #SHTCUT_Event+9)
      AddKeyboardShortcut(0, #PB_Shortcut_X, #SHTCUT_Event+10)
      AddKeyboardShortcut(0, #PB_Shortcut_D, #SHTCUT_Event+11)
      
      TextGadget(#PB_Any, l, k+3, Width/2, Height-3,"Select Image")
      If IsGadget(#GADGET_Editor)  = 0
        EditorGadget(#GADGET_Editor, l , k+20, Width/2, Height): SetGadgetText(#GADGET_Editor, "")
      EndIf
      If IsGadget(#GADGET_Button+3) = 0
        ButtonGadget(#GADGET_Button+3, l, k+40, Width/2, Height, "Set Image")
      EndIf
      If IsGadget(#GADGET_Button+1) = 0
        ButtonGadget(#GADGET_Button+1, l, k+60, 35, Height, "<")
      EndIf
      If IsGadget(#GADGET_Button+2) = 0
        ButtonGadget(#GADGET_Button+2, l+35, k+60, 35, Height, ">")
      EndIf 
      If IsGadget(#GADGET_Button+10) = 0
        ButtonGadget(#GADGET_Button+10,l, k+80, 70, 20, "Insert Image")
      EndIf
      If IsGadget(#GADGET_Button+13) = 0
        ButtonGadget(#GADGET_Button+13,  l, k+100, 70, 20, "Fill Area")
      EndIf
      If IsGadget(#GADGET_Button+16) = 0
        ButtonGadget(#GADGET_Button+16,  l, k+120, 70, 20, "Set Attribute")
      EndIf
      TextGadget(#PB_Any, l, k+143, 35, Height-3,"TileSet")
        If IsGadget(#GADGET_Editor+10) = 0
          EditorGadget(#GADGET_Editor+10, l+35, k+140, 35, Height): SetGadgetText(#GADGET_Editor+10, Str(mapType))
        EndIf
      
      TextGadget(#PB_Any, l, k+160, 35, Height,"tile X")
      TextGadget(#PB_Any, l+35, k+160, 35, Height,"Tile Y")
      If IsGadget(#GADGET_Editor+1) = 0
        EditorGadget(#GADGET_Editor+1, l, k+180, 35, Height): SetGadgetText(#GADGET_Editor+1, Str(matX))
      EndIf
      If IsGadget(#GADGET_Editor+2) = 0
        EditorGadget(#GADGET_Editor+2, l+35, k+180, 35, Height): SetGadgetText(#GADGET_Editor+2, Str(matY))
      EndIf
      
      TextGadget(#PB_Any, l, k+200, 35, Height,"dim X")
      TextGadget(#PB_Any, l+35, k+200, 35, Height,"dim Y")
      If IsGadget(#GADGET_Editor+8) = 0
        EditorGadget(#GADGET_Editor+8, l, k+220, 35, Height): SetGadgetText(#GADGET_Editor+8, Str(area_width))
      EndIf
      If IsGadget(#GADGET_Editor+9) = 0
        EditorGadget(#GADGET_Editor+9, l+35, k+220, 35, Height): SetGadgetText(#GADGET_Editor+9, Str(area_height))
      EndIf
      If IsGadget(#GADGET_Editor+15) = 0
        ButtonGadget(#GADGET_Button+15, l, k+240, 70, 20, "Resize")
      EndIf
      
      TextGadget(#PB_Any, l, k+260, 70, Height,"Edit Layer")
      If IsGadget(#GADGET_CheckBox) = 0
        CheckBoxGadget(#GADGET_CheckBox,l, k+280, 70,20,"Bottom"):SetGadgetState(#GADGET_CheckBox,0)
      EndIf
      If IsGadget(#GADGET_CheckBox+1) = 0
        CheckBoxGadget(#GADGET_CheckBox+1,l, k+300, 70,20,"Middle"):SetGadgetState(#GADGET_CheckBox+1,1)
      EndIf
      If IsGadget(#GADGET_CheckBox+2) = 0
        CheckBoxGadget(#GADGET_CheckBox+2,l, k+320, 70,20,"Top"):SetGadgetState(#GADGET_CheckBox+2,0)
      EndIf

      Gosub initTilePallete
 EndIf 

Gosub readTemp
Return 


;- initTilePallete
initTilePallete:
    CreateImage(292, imageWidth, imageHeight)
    
   UseWindow(0)
        l = 645
        k = 0
        Width = 140
        Height = 20
        makeMapData = 0; dont make
        
        If IsImage(0) ; null image
          FreeImage(0)
          CreateImage(0,imageWidth, imageHeight)
          StartDrawing(ImageOutput())
            Box(1,1,imageWidth-2, imageHeight-2,RGB(255,255,255))
          StopDrawing()
        EndIf

        TextGadget(#PB_Any, l+80, k+3, Width, Height-3,"Tiles")
        If IsGadget(#GADGET_Text+6)
          FreeGadget(#GADGET_Text+6)
        EndIf
        TextGadget(#GADGET_Text+6, l+80+ImageWidth, k+16, 25, Height*2,Chr(13)+Str(currentImage))
        
        
        i = currentImage
        For j = 0 To 9
          If IsGadget(#GADGET_Image+1+j)
             FreeGadget(#GADGET_Image+1+j)
          EndIf
        Next
        For j = 0 To 9
          i = getNextImage(i)
          UseImage(i)
          ImageGadget(#GADGET_Image+1+j, l+80, k+20+ImageWidth*j,ImageWidth,ImageHeight,ImageID())
        Next
        TextGadget(#PB_Any, 650,340, 70, 30,"Primary"+Chr(13)+"Secondary") 
        UseImage(leftClickedImage)
        
        For j = 0 To 1
          If IsGadget(#GADGET_Image+21+j)
            FreeGadget(#GADGET_Image+21+j)
          EndIf
        Next
        
        ImageGadget(#GADGET_Image+21, 660, 370,ImageWidth,ImageHeight,ImageID())
        UseImage(getNextImage(rightClickedImage))
        ImageGadget(#GADGET_Image+22, 660, 370+ImageHeight,ImageWidth,ImageHeight,ImageID()) 
        
        If 20+imageHeight*11 > 480
          l =  20+imageHeight*11
        ElseIf 20+imageHeight*11 < 480
          l = 480
        Else
          l = WindowHeight()
        EndIf 
        ResizeWindow(725+ImageWidth+30,l)
      UseImage(0)
      imageWidth = ImageWidth()
      imageHeight = ImageHeight()       
Return




;- checkforGadgets
checkForGadgets:
    
    
EventID.l = WaitWindowEvent()
   
    m = 0
    Select EventID
    
    
      Case #WM_LBUTTONDOWN
        If mX>0 And mX<640 And mY>0 And mY<480
          If mX > cam_x And mX<cam_x+(area_width+1)*imageWidth And mY>cam_y And mY<cam_y+(area_height+1)*imageHeight
            If GetGadgetState(#GADGET_CheckBox) = 1
              mapBottom(Int(mX/imageWidth-cam_x/imageWidth), Int(mY/imageHeight-cam_y/imageHeight)) = leftClickedImage
            ElseIf GetGadgetState(#GADGET_CheckBox+1) = 1
              map(Int(mX/imageWidth-cam_x/imageWidth), Int(mY/imageHeight-cam_y/imageHeight)) = leftClickedImage
            ElseIf GetGadgetState(#GADGET_CheckBox+2) = 1
              mapTop(Int(mX/imageWidth-cam_x/imageWidth), Int(mY/imageHeight-cam_y/imageHeight)) = leftClickedImage
            EndIf 
          EndIf
        EndIf 
     
      Case #WM_RBUTTONDOWN
        If mX>0 And mX<640 And mY>0 And mY<480
          If mX > cam_x And mX<cam_x+(area_width+1)*imageWidth And mY>cam_y And mY<cam_y+(area_height+1)*imageHeight
            If GetGadgetState(#GADGET_CheckBox) = 1
              mapBottom(Int(mX/imageWidth-cam_x/imageWidth), Int(mY/imageHeight-cam_y/imageHeight)) = rightClickedImage
            ElseIf GetGadgetState(#GADGET_CheckBox+1) = 1
              map(Int(mX/imageWidth-cam_x/imageWidth), Int(mY/imageHeight-cam_y/imageHeight)) = rightClickedImage
            ElseIf GetGadgetState(#GADGET_CheckBox+2) = 1
              mapTop(Int(mX/imageWidth-cam_x/imageWidth), Int(mY/imageHeight-cam_y/imageHeight)) = rightClickedImage
            EndIf 
          EndIf
        EndIf
              
      Case #PB_EventMenu                         ; A Menu item has been selected
        Select EventMenuID()
      
          Case #newMap
            Gosub NewMap
          
          Case #loadMapFile
            Gosub loadMapFile
          
          Case #saveMapFile
            Gosub saveMapFile
            
          Case #saveMap
            Gosub saveMap
            
          Case #showBottomMap
            If showBottomMap = 0
              showBottomMap = 1
            Else
              showBottomMap = 0
            EndIf
            
          Case #showMiddleMap
            If showMiddleMap = 0
              showMiddleMap = 1
            Else
              showMiddleMap = 0
            EndIf
            
          Case #showTopMap
            If showTopMap = 0
              showTopMap = 1
            Else
              showTopMap = 0
            EndIf
          
          Case #showAttributeMap
            If showAttributeMap = 0
              showAttributeMap = 1
            Else
              showAttributeMap = 0
            EndIf    
            
          Case #showMap
            Gosub showMap 
            
          Case #showConsole
            If showConsoleMap = 0
              OpenConsole()
              ConsoleColor(1,15)
              showConsoleMap = 1
            Else
              CloseConsole()
              showConsoleMap = 0
            EndIf    
                
            
          Case #fillAll ; exit
            Result = MessageRequester("Map Maker","Fill the entire Map?",#PB_MessageRequester_YesNo) 
            If Result = 6        ; pressed Yes button (Result = 6) 
              Gosub fillAll
            ElseIf Result = 7    ; pressed No button (Result = 7) 
              eventID = 0
            EndIf 
                         
          Case #loadBMP
            fileType$ = "bmp"
            Gosub loadTiles

          Case #loadPNG
            fileType$ = "png" 
            Gosub loadTiles
            
          Case #loadJPEG
            fileType$ = "jpg" 
            Gosub loadTiles
            
          Case #loadTIFF
            fileType$ = "tif" 
            Gosub loadTiles
            
          Case #loadTGA
            fileType$ = "tga" 
            Gosub loadTiles

          Case #setAttribute
            Gosub setAttribute
            
          Case #tilenator
            Gosub tilenator
               
          Case #editExtraData
            Gosub editExtraData

          Case #editLayerData
            Gosub editLayerData
                      
          Case #exit ; exit
            Result = MessageRequester("Map Maker","Are you sure you want to exit?",#PB_MessageRequester_YesNo) 
            If Result = 6        ; pressed Yes button (Result = 6) 
               eventID = #PB_Event_CloseWindow 
            ElseIf Result = 7    ; pressed No button (Result = 7) 
              eventID = 0
            EndIf 
         
          Case #info ; info  
            MessageRequester("info","version 1.0"+Chr(13)+"Programmed by: Kenneth Cason"+Chr(13)+"Email: magus_fireball@yahoo.com",0) 

          Case #help ; help
            If ReadFile(#file, "help.txt")
              s$ = ""
              t$ = "f"
              While t$ <> "%-%"
                t$ = ReadString()
                s$ = s$ + t$ + Chr(13)
              Wend
              MessageRequester("Help File",s$,0)
            Else
              MessageRequester("Help File Not Found","Arrow keys - Scroll around map"+Chr(13)+"C & V - Pan through tiles"+Chr(13)+"Z & X - Pan through Attributes"+Chr(13)+"Space - Draw current tile"+Chr(13)+"S - Set tile attributes"+Chr(13)+"F - Fill area",0) 
            EndIf
     
                   
          Case #SHTCUT_Event
            Goto _insert
          Case #SHTCUT_Event+1
            Gosub _up
          Case #SHTCUT_Event+2
            Gosub _down
          Case #SHTCUT_Event+3
            Gosub _left
          Case #SHTCUT_Event+4
            Gosub _right
          Case #SHTCUT_Event+5
            Gosub scrollTilesDown
          Case #SHTCUT_Event+6
            Gosub drawTileSelection
          Case #SHTCUT_Event+7
            Gosub fillArea
          Case #SHTCUT_Event+8
            Goto _s     
         ; Case #SHTCUT_Event+9
         ;   Gosub scrollAttributesDown
         ; Case #SHTCUT_Event+10
         ;   Gosub drawAttributesSelection
          Case #SHTCUT_Event+11
            Result = MessageRequester("Map Maker","Fill the entire Map?",#PB_MessageRequester_YesNo) 
            If Result = 6        ; pressed Yes button (Result = 6) 
              Gosub fillAll
            ElseIf Result = 7    ; pressed No button (Result = 7) 
              eventID = 0
            EndIf 
                 
        EndSelect

  
        Case #PB_Event_Gadget 
          Select EventGadgetID()
            
            Case #GADGET_CheckBox
              If GetGadgetState(#GADGET_CheckBox) = 1
                SetGadgetState(#GADGET_CheckBox, 1)
                SetGadgetState(#GADGET_CheckBox+1, 0)
                SetGadgetState(#GADGET_CheckBox+2, 0)
              EndIf

            Case #GADGET_CheckBox+1
              If GetGadgetState(#GADGET_CheckBox+1) = 1
                SetGadgetState(#GADGET_CheckBox, 0)
                SetGadgetState(#GADGET_CheckBox+1, 1)
                SetGadgetState(#GADGET_CheckBox+2, 0)
              EndIf
              
            Case #GADGET_CheckBox+2
              If GetGadgetState(#GADGET_CheckBox+2) = 1
                SetGadgetState(#GADGET_CheckBox, 0)
                SetGadgetState(#GADGET_CheckBox+1, 0)
                SetGadgetState(#GADGET_CheckBox+2, 1)
              EndIf   
            
            Case #GADGET_Image+1
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID())
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+2
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID())
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+3
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID())
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+4
              Gosub getClickedImage 
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID()) 
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+5
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID())
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf  
            Case #GADGET_Image+6
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID())
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+7
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID())
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+8
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID())
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+9
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf  
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID()) 
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
            Case #GADGET_Image+10
              Gosub getClickedImage
              m = 0
              If EventType() = #PB_EventType_RightClick
                m = 1
              EndIf  
              UseImage(k)
              SetGadgetState(#GADGET_Image+21+m,ImageID()) 
              If m = 0 
                leftClickedImage = k
              Else
                rightClickedImage = k
              EndIf 
                    
           
            Case #GADGET_Button
              exit = 1
                
        
            Case #GADGET_Button+3 ; update Image
              k = Val(GetGadgetText(#GADGET_Editor))
              If k > minImage And k < maxImage
                Repeat
                  If IsImage(k)
                    Break
                  Else
                    k+1
                  EndIf
                  If k > maxImage
                    k = minImage
                  ElseIf k < minImage
                    k = maxImage
                  EndIf 
                ForEver
                currentImage = k
             EndIf 
             SetGadgetText(#GADGET_Editor,Str(currentImage))
             Gosub drawTileSelection   
          
              
           Case #GADGET_Editor+1 ;Select locationX
             k = Val(GetGadgetText(#GADGET_Editor+1))
             If k >= 0 And k < area_width
               matX = k
             EndIf 

           Case #GADGET_Editor+2 ;Select locationY
             k = Val(GetGadgetText(#GADGET_Editor+2))
             If k >= 0 And k < area_height
               matY = k
             EndIf 

           Case #GADGET_Button+15 ;Select dimX and dimY
             Gosub setDimXY
             
           Case #GADGET_Button+1
             Gosub scrollTilesDown
             
           Case #GADGET_Button+2
             Gosub drawTileSelection

           Case #GADGET_Button+10 ; insert Image
             _insert:
             If IsImage(currentImage) And matX <= area_width And matY <= area_height
               map(matX,matY) = currentImage
             EndIf 
             
           Case #GADGET_Button+11 ; new Map
             If IsGadget(#GADGET_Image+1)
               Gosub NewMap
             Else 
               MessageRequester("MapMaker", "Please load your Tiles first")
             EndIf 
             

           Case #GADGET_Button+13 ; fill area
             Gosub fillArea
             
           Case #GADGET_Button+16  ; set special attribute
             _s:
             Gosub setAttribute        
                        
           Case #GADGET_Editor+10 ; mapData
             mapType = Val(GetGadgetText(#GADGET_Editor+10))
             
      EndSelect           
    EndSelect 


Return 


;-setDimXY
setDimXY:
  j = Val(GetGadgetText(#GADGET_Editor+8))
  k = Val(GetGadgetText(#GADGET_Editor+9))
  
 
  If j > 0 And k > 0
    Dim mapT.w(j,k)
    For y = 0 To y = k
      If  y > area_height
        Break 
      EndIf 
      For x = 0 To x = j
        If  x > area_width
          Break 
        EndIf 
        mapT(x,y) = mapBottom(x,y)
      Next
    Next
    Dim mapBottom.b(j,k)
    For y = 0 To y = k
      For x = 0 To x = j
        mapBottom(x,y) = mapT(x,y)
      Next
    Next


    Dim mapT.w(j,k) 
    For y = 0 To y = k
      If  y > area_height
        Break 
      EndIf 
      For x = 0 To x = j
        If  x > area_width
          Break 
        EndIf 
        mapT(x,y) = map(x,y)
      Next
    Next
    Dim map.b(j,k)
    For y = 0 To y = k
      For x = 0 To x = j
        map(x,y) = mapT(x,y)
      Next
    Next


    Dim mapT.w(j,k)
    For y = 0 To y = k
      If  y > area_height
        Break 
      EndIf 
      For x = 0 To x = j
        If  x > area_width
          Break 
        EndIf 
        mapT(x,y) = mapTop(x,y)
      Next
    Next
    Dim mapTop.b(j,k)
    For y = 0 To y = k
      For x = 0 To x = j
        mapTop(x,y) = mapT(x,y)
      Next
    Next
    

    Dim mapT.w(j,k)
    For y = 0 To y = k
      If  y > area_height
        Break 
      EndIf 
      For x = 0 To x = j
        If  x > area_width
          Break 
        EndIf 
        mapT(x,y) = mapData(x,y)
      Next
    Next
    Dim mapData.b(j,k)
    For y = 0 To y = k
      For x = 0 To x = j
        mapData(x,y) = mapT(x,y)
      Next
    Next
    
    area_width = j-1
    area_height = k-1
    
 
  FreeMemory(mapT)
EndIf

Return 

;-move around
_up:
  If matY > 0
    matY-1
    SetGadgetText(#GADGET_Editor+1, Str(matX))
    SetGadgetText(#GADGET_Editor+2, Str(matY))
  EndIf 
Return 

_down:
  If matY < area_Height
    matY+1
    SetGadgetText(#GADGET_Editor+1, Str(matX))
    SetGadgetText(#GADGET_Editor+2, Str(matY))
  EndIf 
Return 


_left:
  If matX > 0
    matX-1
    SetGadgetText(#GADGET_Editor+1, Str(matX))
    SetGadgetText(#GADGET_Editor+2, Str(matY))
  EndIf 
Return 

_right:
  If matX < area_Width
    matX+1
    SetGadgetText(#GADGET_Editor+1, Str(matX))
    SetGadgetText(#GADGET_Editor+2, Str(matY))
  EndIf 
Return
 

;-scrollTilesdown
scrollTilesDown:
    For k = 0 To 1
      currentImage = getPreviousImage(currentImage)
    Next
    Gosub drawTileSelection
Return  


;-drawTileSelection
drawTileSelection:
i = currentImage
For j = 0 To 9
    i = getNextImage(i)
    If j = 0
      currentImage = i
    EndIf 
    UseImage(i)
    If IsGadget(#GADGET_Image+1+j)
      SetGadgetState(#GADGET_Image+1+j,ImageID()) 
    EndIf 
      SetGadgetText(#GADGET_Text+6,Chr(13)+Str(currentImage))  
Next 
    UseImage(leftClickedImage)
    If IsGadget(#GADGET_Image+21)
      SetGadgetState(#GADGET_Image+21,ImageID()) 
    EndIf 
    UseImage(rightClickedImage)
    If IsGadget(#GADGET_Image+22)
      SetGadgetState(#GADGET_Image+22,ImageID()) 
    EndIf 
Return  


;-scrollAttributesdown
;scrollAttributesDown:
;   For k = 0 To 1
;     currentAttributeImage = getPreviousAttributeImage(currentAttributeImage)
;    Next 
;    Gosub drawAttributesSelection
;Return

;-drawAttributesSelection

;drawAttributesSelection:
;i = currentAttributeImage
;For j = 0 To 9
;    i = getNextAttributeImage(i)
;    If j = 0
;      currentAttributeImage = i
;    EndIf 
;    UseImage(0)
;    SetGadgetState(#GADGET_Image+11+j,ImageID()) 
;    UseImage(i)
;    If IsGadget(#GADGET_Image+11+j)
;      SetGadgetState(#GADGET_Image+11+j,ImageID()) 
;    EndIf 
;    SetGadgetText(#GADGET_Text+5,Chr(13)+Str(currentAttributeImage))
;Next 
;Return 

;- saveMapFile
saveMapFile:
  fileM$ = StringField(fileM$, 1, ".")
  fileM$ = SaveFileRequester("Save Map file",fileM$,"LVL(*.lvl)|*.lvl",0)
  If IsFilename(fileM$) 
    DeleteFile(fileM$) 
  EndIf 
  If GetExtensionPart(fileM$) <> "lvl"
    fileM$+".lvl"
  EndIf
  If OpenFile(#File, fileM$)
    WriteWord(area_Width)
    WriteWord(area_Height)
    WriteByte(layers)
    WriteByte(mapType)
    WriteByte(extraDataLength)
    For k = 1 To extraDataLength
      WriteByte(extraData(k))
    Next
    For y = 0 To area_height
      For x = 0 To area_width
        If layers > 1
          WriteByte( mapBottom(x,y) );& $FF )
        EndIf
        WriteByte( map(x,y)); & $FF )
        If layers = 3
          WriteByte( mapTop(x,y)); & $FF )   
        EndIf
      Next
    Next
    CloseFile(#File)
  Else
    MessageRequester(title$, "Map file could not be written")
  EndIf
  
  
  fileM$ = StringField(fileM$, 1, ".")
  If GetExtensionPart(fileM$) <> "mdat"
    fileM$+".mdat"
  EndIf
  If OpenFile(#File, fileM$)
    WriteWord(area_Width)
    WriteWord(area_Height) 
    For y = 0 To area_height
      For x = 0 To area_width
        WriteByte( mapData(x,y) )
      Next
    Next
    CloseFile(#File)
    
    Gosub writeTemp 
  Else
    MessageRequester(title$, "Map Data file could not be written")
  EndIf
  
  
Return 


;- loadMapFile
loadMapFile:
  fileM$ = OpenFileRequester("Load Map file",fileM$,"LVL(*.lvl)|*.lvl",0)
  fileM$ = StringField(fileM$, 1, ".")
  If GetExtensionPart(fileM$) <> "lvl"
    fileM$+".lvl"
  EndIf
  If OpenFile(#File,fileM$)
    area_width = ReadWord(); first line width x height
    area_height = ReadWord(); first line width y height 
    layers = ReadByte() ; layers   
    mapType = ReadByte() ; misc data about the map
    extraDataLength = ReadByte() ; determines how much extra data is being read
    Dim extraData.b(extraDataLength)
    For k = 1 To extraDataLength
      extraData(k) = ReadByte()
    Next
      
    SetGadgetText(#GADGET_Editor+10,Str(mapType))
    SetGadgetText(#GADGET_Editor+8,Str(area_width+1))
    SetGadgetText(#GADGET_Editor+9,Str(area_height+1))
    Dim mapBottom.b(area_width, area_height)
    Dim map.b(area_width, area_height)
    Dim mapTop.b(area_width, area_height)
    
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        If layers > 1
          mapBottom(tile_x,tile_y) = ReadByte(); & $FF
        EndIf
        map(tile_x,tile_y) = ReadByte(); & $FF
        If layers = 3
          mapTop(tile_x,tile_y) = ReadByte() ;& $FF
        EndIf
      Next
    Next
    CloseFile(#File)
  Else
    MessageRequester(title$, "Tile map could not be loaded")
  EndIf 


  fileM$ = OpenFileRequester("Load Map Data file",fileM$,"MDAT(*.mdat)|*.mdat",0)
  fileM$ = StringField(fileM$, 1, ".")
  If GetExtensionPart(fileM$) <> "mdat"
    fileM$+".mdat"
  EndIf
  If OpenFile(#File,fileM$)
    x = ReadWord(); first line width x height
    y = ReadWord(); first line width y height
    Dim mapData.b(x, y)
    For tile_y = 0 To y  ;store to array
      For tile_x = 0 To x 
        mapData(tile_x,tile_y) = ReadByte()
      Next
    Next
    CloseFile(#File)
    matX = 0
    matY = 0
    Gosub writeTemp
    mapLoaded = 1

  Else
    Dim mapData.b(area_width, area_height)
    MessageRequester(title$, "Map Data file could not be loaded")
  EndIf 
  
  
Return 

;- drawtiles
drawTiles:
UseWindow(0)
CreateImage(500,640, 480)  ; use this to create a buffer like effect
StartDrawing(ImageOutput())  
  BackColor(0,0,0)
  FrontColor(255,255,255)
  cam_x = (matX-10)*-imageWidth
  cam_y = (maty-7)*-imageHeight

  UseImage(292)
  If showBottomMap = 1 Or showMiddleMap = 1 Or showTopMap = 1
    For k = 0 To 15
      For j = 0 To cam_x/imageWidth - 1
        If j*imageWidth + imageWidth < 641
          DrawImage(ImageID(),j*imageWidth, k*imageHeight)
        EndIf
      Next
    Next

    For k = 0 To 15
      For j = cam_x/imageWidth + 1 + area_width To 19
        If j*imageWidth + imageWidth < 641
          DrawImage(ImageID(),j*imageWidth, k*imageHeight)
        EndIf
      Next
    Next
    
   
    For k = 0 To cam_y/imageHeight - 1
      For j = cam_x/imageWidth - 1 To cam_x/imageWidth + area_width
        If j < 20
          If j*imageWidth + imageWidth < 641
            DrawImage(ImageID(),j*imageWidth, k*imageHeight)
          EndIf
        EndIf 
      Next
    Next
  
    For k = cam_y/imageHeight + area_height + 1 To 15
      For j = cam_x/imageWidth - 1 To cam_x/imageWidth + area_width
        If j < 20
          If j*imageWidth+imageWidth < 641
            DrawImage(ImageID(),j*imageWidth, k*imageHeight)
          EndIf
        EndIf 
      Next
    Next
  Else
    Box(0, 0, 640, 480, RGB(0,0,0))
  EndIf
    
  j = scopeY
  For tile_y = matY-j To matY+j
    If tile_y <=0
      tile_y =0
    EndIf
    While  matY+j > area_height
      j-1
    Wend
    n = scopeX
    For tile_x = matX-n To matX+n
      If tile_x <= 0
        tile_x = 0
      EndIf

      While  matX+n > area_width
        n-1
      Wend
      
        If showBottomMap = 1
          If IsImage(mapBottom(tile_x,tile_y) & $FF)
            UseImage(mapBottom(tile_x,tile_y) & $FF)
           If tile_x*imageWidth+cam_x+imageWidth < 641
              DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
            EndIf
         EndIf 
        Else
          UseImage(292)
          DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
        EndIf 
        
        If showMiddleMap = 1
          If IsImage(map(tile_x,tile_y) & $FF)
            If tile_x*imageWidth+cam_x+imageWidth < 641 And map(tile_x,tile_y) & $FF > 0
              UseImage(map(tile_x,tile_y) & $FF)
              DrawImage(UseImage(map(tile_x,tile_y) & $FF),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
            EndIf
          EndIf 
        Else
         ; Locate(tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
         ; DrawText(Str(map(tile_x, tile_y) & $FF))
        EndIf 
       
        
        
       If showTopMap = 1
         If IsImage(mapTop(tile_x,tile_y) & $FF)
           UseImage(mapTop(tile_x,tile_y) & $FF)
           If tile_x*imageWidth+cam_x+imageWidth < 641 And mapTop(tile_x,tile_y) & $FF > 0
             DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
           EndIf
         EndIf 
       EndIf 
        
          If showAttributeMap = 1 And tile_x <= area_width And tile_y <= area_height
            k = mapData(tile_x,tile_y)
            If k & %10000000 = %10000000
               UseImage(257) ; walkable
               DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
            EndIf
            If k & %01000000 = %01000000
               UseImage(258) ; swimmable
               DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
            EndIf
            If k & %00100000 = %00100000
               UseImage(259) ; npc passable
               DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
            EndIf
            k = k & %00011111
            If k > %00000000
               UseImage(260+k) ; npc passable
               DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
            EndIf 
            k = mapData(tile_x,tile_y)
            k = k & %00011111
            If k > %00000000
               UseImage(260+k) ; npc passable
               DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y) 
            EndIf 
         EndIf   
     ; Else
        ;UseImage(0)
        ; DrawImage(ImageID(),tile_x*imageWidth+cam_x, tile_y*imageHeight+cam_y)
     ; EndIf 
    Next
  Next 

        UseImage(256)
        DrawImage(ImageID(),matX*imageWidth+cam_x, (matY)*imageHeight+cam_y)
  StopDrawing()  
  StartDrawing(WindowOutput())
  UseImage(500)
  DrawImage(ImageID(),0,0)
  StopDrawing() 
Return 


;- EditLayerData
EditLayerData:

  If OpenWindow(1,WindowX()+windowX,200, 70, 65, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "New Map")
  exit2 = 0
    l = 5
    k = 5
    Width = 70
    Height = 20
    UseWindow(1)
    ActivateWindow()
    If CreateGadgetList(WindowID()) 
      TextGadget(#PB_Any, l, k, Width, Height,"Layers")
      EditorGadget(#GADGET_Editor+3, l, k+20, Width, Height)
      ButtonGadget(#GADGET_Button+17, l, k+40, Width, Height, "Done")  
    EndIf 
    
  Repeat
     If area_width > 0
       Gosub drawTiles
     EndIf
     EventID2.l = WaitWindowEvent()
         
    Select EventID2
      Case #PB_Event_Gadget 
        Select EventGadgetID()
          Case #GADGET_Button+17
            exit2 = 1
        EndSelect
    EndSelect 
    
  Until exit2 = 1

  layers = Val(GetGadgetText(#GADGET_Editor+3)) -1
  If layers < 1 Or layers > 3
    layers = 3
  EndIf 
  
  CloseWindow(1)
  If IsWindow(0)
    UseWindow(0)
  EndIf 
  
  EndIf  
  
Return



;- newmap
NewMap:
  If OpenWindow(1,WindowX()+windowX,200, 70, 145, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "New Map")
  exit2 = 0
    l = 5
    k = 5
    Width = 70
    Height = 20
    UseWindow(1)
    ActivateWindow()
    If CreateGadgetList(WindowID())
   
      TextGadget(#PB_Any, l, k, Width, Height,"Map Width")
      EditorGadget(#GADGET_Editor+3, l, k+20, Width, Height)
      TextGadget(#PB_Any, l, k+40, Width, Height,"Map Height")
      EditorGadget(#GADGET_Editor+4, l, k+60, Width, Height)
      TextGadget(#PB_Any, l, k+80, Width, Height,"Layers")
      EditorGadget(#GADGET_Editor+5, l, k+100, Width, Height)
     
      ButtonGadget(#GADGET_Button+17, l, k+120, Width, Height, "Done")
   
    EndIf 
    
  Repeat
     If area_width > 0
       Gosub drawTiles
     EndIf
     EventID2.l = WaitWindowEvent()
         
    Select EventID2
      Case #PB_Event_Gadget 
        Select EventGadgetID()
          Case #GADGET_Button+17
            exit2 = 1
        EndSelect
    EndSelect 
    
  Until exit2 = 1

  area_width = Val(GetGadgetText(#GADGET_Editor+3)) -1
  If area_width < 1
    area_width = 1
  EndIf 
  area_height = Val(GetGadgetText(#GADGET_Editor+4)) -1
  If area_height < 1
    area_height = 1
  EndIf 
  layers = Val(GetGadgetText(#GADGET_Editor+5))
  If layers < 1 Or layers > 3
    layers = 3
  EndIf 
  Dim mapBottom.b(area_width+1, area_height+1)
  Dim map.b(area_width+1, area_height+1)
  Dim mapTop.b(area_width+1, area_height+1)
  Dim mapData.b(area_width+1, area_height+1)
  Dim extraData.b(0)
  extraDataLength = 0
  matX = 0
  matY = 0

  cam_x = (matX-10)*-imageWidth
  cam_y = (maty-7)*-imageHeight
  scopeX = 9
  scopeY = 8
  mapLoaded = 1
  
  CloseWindow(1)
  If IsWindow(0)
    UseWindow(0)
  EndIf 
  
  EndIf  
  
Return 

  
;- loadtiles  
loadTiles:
fileT$ = PathRequester("select directory of tiles", fileT$) 


Gosub writeTemp 
If fileT$ 

    For k = 1 To 255
      If IsImage(k) 
        FreeImage(k)
      EndIf 
    Next
    
    ExamineDirectory(0,fileT$, "*."+fileType$)
    While NextDirectoryEntry() = 1
      
      k = Val( StringField(GetFilePart(DirectoryEntryName()), 0, ".") )

      If k > 0 And k < 256 
        If LoadImage(k, fileT$+Str(k)+"."+fileType$)
        EndIf 
      EndIf  
    Wend 
    
    maxImage = 0
    For i = 1 To 255
      If IsImage(i) 
        maxImage = i
      EndIf 
    Next

    minImage = 0
    For i = 1 To 255
      If IsImage(i)
        minImage = i
        Break
      EndIf
    Next
    currentImage = minImage 
       
    leftClickedImage = currentImage
    rightClickedImage = getNextImage(currentImage)
    UseImage(maxImage)
    ImageWidth = ImageWidth()
    imageHeight = ImageHeight()
    
    Gosub init
    
    

   Gosub drawTileSelection
 
Else  
  MessageRequester(title$,"That Is not a valid directory","")
EndIf 

Return 

;-setAttribute 
setAttribute:
  If OpenWindow(2,WindowX()+640,200, 150, 150, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "Set Tile Attribute")
  exit2 = 0
    l = 5
    k = 5
    Width = 140
    Height = 20
    StartX = 0
    StartY = 0
    UseWindow(2)
    ActivateWindow()
    If CreateGadgetList(WindowID())
      TextGadget(#PB_Any, l, k, Width, Height,"bits<0-7>")
      TextGadget(#PB_Any, l, k+20, 35, Height,"0 Walk")
      TextGadget(#PB_Any, l, k+40, 35, Height,"1 Swim")
      TextGadget(#PB_Any, l, k+60, 35, Height,"2 NPC")
      TextGadget(#PB_Any, l, k+80, 60, Height*2,"3-7 Spec")
      CheckBoxGadget(#GADGET_checkBox+3,l, k+100,150,Height,"Associate all Similar Tiles")
      i = mapData(matX,matY)
      If i & %10000000 = %10000000
        a = 1
      Else
        a = 0
      EndIf 
      EditorGadget(#GADGET_Editor+3, l+60, k+20, 30, Height):SetGadgetText(#GADGET_Editor+3,Str(a))
      i = mapData(matX,matY)
      If i & %01000000 = %01000000
        a = 1
      Else
        a = 0
      EndIf 
      EditorGadget(#GADGET_Editor+4, l+60, k+40, 30, Height):SetGadgetText(#GADGET_Editor+4,Str(a))
      i = mapData(matX,matY)
      If i & %00100000 = %00100000
        a = 1
      Else
        a = 0
      EndIf 
      EditorGadget(#GADGET_Editor+5, l+60, k+60, 30, Height):SetGadgetText(#GADGET_Editor+5,Str(a))
      i = mapData(matX,matY)
      EditorGadget(#GADGET_Editor+6, l+60, k+80,30, Height):SetGadgetText(#GADGET_Editor+6,Str(i & %00011111))
      ButtonGadget(#GADGET_Button+14, l, k+120, 30, Height, "Done")
;0x01234567 
;bit position meaning 
;0 - land passable (0 = cant walk on this tile, 1 = can walk) 
;1 - water passable (0 = cant swim/boat on this tile, 1 = can swim/boat) 
;2 - NPC passable (I can imagine a situation where monsters might need To be blocked from entering a town, For instance, but players would be allowed in - monsters still abide by the other passable rules though) 
;3-7 - lookup effect in dat file 
    EndIf 
    
    
  Repeat
     Gosub drawTiles
     EventID3.l = WaitWindowEvent()
         
    Select EventID3
      Case #PB_Event_Gadget 
        Select EventGadgetID()
          Case #GADGET_Button+14
            exit2 = 1
        EndSelect
    EndSelect 
    
  Until exit2 = 1
  
  a = %00000000
  
  If(Val(GetGadgetText(#GADGET_Editor+3)) = 1)
    a | %10000000
  EndIf
  If(Val(GetGadgetText(#GADGET_Editor+4)) = 1)
    a | %01000000
  EndIf  
  If(Val(GetGadgetText(#GADGET_Editor+5)) = 1)
    a | %00100000
  EndIf   
  k = Val(GetGadgetText(#GADGET_Editor+6))
  If(k > 0 And k < 32)
    a | (%00000000+k)
  EndIf

  mapData(matX, matY) = a
  
  If GetGadgetState(#GADGET_checkBox+3) = 1
  If layers = 3 ; use middle layer
    k = map(matX, matY)
  Else ; use bottom layer
    k = mapBottom(matX, matY)
  EndIf
    For y = 0 To area_height
      For x = 0 To area_width
        If (map(x, y) = k And layers = 3) Or (mapBottom(x,y) = k); for all other like tiles
          mapData(x, y) = a
        EndIf
      Next
    Next
  EndIf 
  
  CloseWindow(2)
  If IsWindow(0)
    UseWindow(0)
  EndIf 
  
  EndIf  
  
Return 

  

;- fillArea
fillArea:

Dim temp.b(area_width+1,area_height+1) 

maxX = area_width
If GetGadgetState(#GADGET_CheckBox) = 1
  For y = 0 To area_height
    For x = 0 To area_width
      temp(x,y) = mapBottom(x,y)
    Next
  Next
  copyArea = mapBottom(matX,matY)
ElseIf GetGadgetState(#GADGET_CheckBox+1) = 1
  For y = 0 To area_height
    For x = 0 To area_width
      temp(x,y) = map(x,y)
    Next
  Next
  copyArea = map(matX,matY)
Else
  For y = 0 To area_height
    For x = 0 To area_width
      temp(x,y) = mapTop(x,y)
    Next
  Next
  copyArea = mapTop(matX,matY)
EndIf


; lower right quad
For y = matY To area_height
  x = matX
  If temp(x,y) = copyArea
    For x = matX To area_width 
       If temp(x,y) <> copyArea
         Break
       Else 
         If IsImage(currentImage) And x <= area_width And y <= area_height
           temp(x,y) = currentImage
         EndIf 
       EndIf 
    Next
  Else
    Break 
  EndIf 
Next 
; upper right quad
For y = matY-1 To 0 Step -1
  x = matX
  If temp(x,y) = copyArea
      For x = matX To area_width 
         If temp(x,y) <> copyArea And x <> matX And y <> matY
           Break
         Else 
           If IsImage(currentImage) And x <= area_width And y <= area_height
             temp(x,y) = currentImage
           EndIf 
         EndIf 
      Next 
  Else
    Break 
  EndIf
Next 
; lower left quad
For y = matY To area_height
  x = matX-1
  If x = -1 
    Break
  EndIf 
  If temp(x,y) = copyArea
    For x = matX-1 To 0 Step - 1
       If temp(x,y) <> copyArea
         Break
       Else 
         If IsImage(currentImage) And x <= area_width And y <= area_height
           temp(x,y) = currentImage
         EndIf 
       EndIf 
    Next
  Else
    Break 
  EndIf 
Next 
; upper left quad
For y = matY-1 To 0 Step -1
  x = matX-1
  If x = -1 
    Break
  EndIf 
  If temp(x,y) = copyArea
      For x = matX-1 To 0 Step -1 
         If temp(x,y) <> copyArea And x <> matX And y <> matY
           Break
         Else 
           If IsImage(currentImage) And x <= area_width And y <= area_height
             temp(x,y) = currentImage
           EndIf 
         EndIf 
      Next 
  Else
    Break 
  EndIf
Next 

If GetGadgetState(#GADGET_CheckBox) = 1
  For y = 0 To area_height
    For x = 0 To area_width
      mapBottom(x,y) = temp(x,y)
    Next
  Next
ElseIf GetGadgetState(#GADGET_CheckBox+1) = 1
  For y = 0 To area_height
    For x = 0 To area_width
      map(x,y) = temp(x,y) 
    Next
  Next
Else
  For y = 0 To area_height
    For x = 0 To area_width
      mapTop(x,y) = temp(x,y)
    Next
  Next
EndIf
FreeMemory(temp)



Return 


;-fillAll
fillAll:

If GetGadgetState(#GADGET_CheckBox) = 1
  For y = 0 To area_height
    For x = 0 To area_width
      mapBottom(x,y) = currentImage
    Next
  Next
ElseIf GetGadgetState(#GADGET_CheckBox+1) = 1
  For y = 0 To area_height
    For x = 0 To area_width
      map(x,y) = currentImage
    Next
  Next
ElseIf GetGadgetState(#GADGET_CheckBox+2) = 1
  For y = 0 To area_height
    For x = 0 To area_width
      mapTop(x,y) = currentImage
    Next
  Next
EndIf
Return


;- write temp
writeTemp: 
  If OpenFile(0, "d.tlr")
    WriteStringN(fileT$)
    WriteStringN(fileM$)
    WriteStringN(fileMD$)
    WriteStringN(fileMap$)
    WriteStringN(fileTile$)
    WriteStringN(fileTileSav$)
    CloseFile(0)
  EndIf
Return 


;- read temp
readTemp:
  
  If OpenFile(0, "d.tlr")    
    fileT$ = ReadString()
    fileM$ = ReadString()
    fileMD$ = ReadString()
    fileMap$ = ReadString()
    fileTile$ = ReadString()
    fileTileSav$ = ReadString()
    CloseFile(0)
  EndIf
Return 


;- showMap
showMap:

If OpenWindow(2,WindowX(),WindowY(), 660, 500, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "View Map: Zoom = 100%")
    exit2 = 0
    l = 5
    k = 5
    Width = 70
    Height = 20
    UseWindow(2)
CreateImage(294, area_width*imageWidth+imageWidth, area_height*imageHeight+imageHeight)
StartDrawing(ImageOutput())
  For y = 0 To area_height
    For x = 0 To area_width
      If showBottomMap = 1
        If IsImage(mapBottom(x,y) & $FF)
          If mapBottom(x,y) & $FF > 0
            DrawImage(UseImage(mapBottom(x,y) & $FF), x*imageWidth, y*imageHeight, imageWidth, ImageHeight)
          EndIf
        EndIf
      EndIf
      If showMiddleMap = 1
        If IsImage(map(x,y) & $FF)
          If map(x,y) & $FF > 0
            DrawImage(UseImage(map(x,y) & $FF), x*imageWidth, y*imageHeight, imageWidth, ImageHeight)
          EndIf
        EndIf
      EndIf
      If showTopMap = 1
        If IsImage(mapTop(x,y) & $FF)
          If mapTop(x,y) & $FF > 0
            DrawImage(UseImage(mapTop(x,y) & $FF), x*imageWidth, y*imageHeight, imageWidth, ImageHeight)
          EndIf
        EndIf
      EndIf
      If showAttributeMap = 1
          If mapData(x,y) & $FF > 0
            k = mapData(x,y)
            If k & %10000000 = %10000000
               UseImage(257) ; walkable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf
            If k & %01000000 = %01000000
               UseImage(258) ; swimmable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf
            If k & %00100000 = %00100000
               UseImage(259) ; npc passable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf
            k = k & %00011111
            If k > %00000000
               UseImage(260+k) ; npc passable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf 
            k = mapData(x,y)
            k = k & %00011111
            If k > %00000000
               UseImage(260+k) ; npc passable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight) 
            EndIf 
          EndIf
      EndIf   
    Next
  Next 
StopDrawing()
CopyImage(294, 295)

     xold = ImageWidth()
     yold = ImageHeight()
     x = xold
     y = yold
     

If CreateGadgetList(WindowID())
  ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, x, y, 32)  
  ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(295)) 
EndIf 


     
  Repeat
     Gosub drawTiles
     
     UseWindow(2)
     SetGadgetState(#GADGET_ScrollImage,UseImage(295)) 
     EventID2.l = WaitWindowEvent()
         
    Select EventID2
    
      Case #WM_LBUTTONDOWN
        If Int((x/xold)*100) >= 15
          CopyImage(294, 295)
          x - xold*0.05
          y - yold*0.05
          ResizeImage(295, x, y, #PB_Image_Raw)
          SetWindowTitle(2,"View Map: Zoom = "+Str(Int((x/xold)*100))+"%") 
          If CreateGadgetList(WindowID()) 
            ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, x, y, 32)  
            ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(295)) 
          EndIf 
        EndIf 
      Case #WM_RBUTTONDOWN
        If Int((x/xold)*100) <= 195
          CopyImage(294, 295)
          x + xold*0.05
          y + yold*0.05  
          ResizeImage(295, x, y, #PB_Image_Raw)
          SetWindowTitle(2,"View Map: Zoom = "+Str(Int((x/xold)*100))+"%")
          If CreateGadgetList(WindowID()) 
            ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, x, y, 32)  
            ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(295)) 
          EndIf 
        EndIf
      
             
      Case #PB_Event_CloseWindow
        exit2 = 1
    EndSelect
    
  Until exit2 = 1
  
   
  CloseWindow(2)
  If IsWindow(0)
    UseWindow(0)
  EndIf 
  
EndIf  
  
Return 

;- saveMap
saveMap:
  
CreateImage(294, area_width*imageWidth+imageWidth, area_height*imageHeight+imageHeight)
StartDrawing(ImageOutput())
  For y = 0 To area_height
    For x = 0 To area_width
      If showBottomMap = 1 
        If IsImage(mapBottom(x,y) & $FF)
          If mapBottom(x,y) & $FF > 0
            DrawImage(UseImage(mapBottom(x,y) & $FF), x*imageWidth, y*imageHeight, imageWidth, ImageHeight)
          EndIf
        EndIf
      EndIf
      If showMiddleMap = 1
        If IsImage(map(x,y) & $FF)
          If map(x,y) & $FF > 0
            DrawImage(UseImage(map(x,y) & $FF), x*imageWidth, y*imageHeight, imageWidth, ImageHeight)
          EndIf
        EndIf
      EndIf
      If showTopMap = 1
        If IsImage(mapTop(x,y) & $FF)
          If mapTop(x,y) & $FF > 0
            DrawImage(UseImage(mapTop(x,y) & $FF), x*imageWidth, y*imageHeight, imageWidth, ImageHeight)
          EndIf
        EndIf
      EndIf
      If showAttributeMap = 1
          If mapData(x,y) & $FF > 0
            k = mapData(x,y)
            If k & %10000000 = %10000000
               UseImage(257) ; walkable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf
            If k & %01000000 = %01000000
               UseImage(258) ; swimmable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf
            If k & %00100000 = %00100000
               UseImage(259) ; npc passable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf
            k = k & %00011111
            If k > %00000000
               UseImage(260+k) ; npc passable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight)
            EndIf 
            k = mapData(x,y)
            k = k & %00011111
            If k > %00000000
               UseImage(260+k) ; npc passable
               DrawImage(ImageID(),x*imageWidth, y*imageHeight) 
            EndIf 
          EndIf
      EndIf   
    Next
  Next 
StopDrawing()

  fileMap$ = SaveFileRequester("Save Map",fileMap$,pattern$,0)
  If fileMap$ <> ""
    SaveImage(294, fileMap$+"."+fileType$)  
    Gosub writeTemp 
  Else
    MessageRequester(title$, "Map could not be written")
  EndIf
Return 



;- getClickedImage
getClickedImage:
  If mX > 725 And mX < 725+imageWidth And mY > 20 And mY < 20+10*imageHeight
    k = currentImage
    For j = 1 To Int((mY-20)/imageHeight)
      k = getNextImage(k)
    Next
  EndIf
Return


;- consoleMap
consoleMap:
    ClearConsole()
    PrintN("1st")
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        Print(Str(mapBottom(tile_x,tile_y))+Space(4-Len( Str(mapBottom(tile_x,tile_y))) ) )
      Next
      PrintN("")
    Next  
    PrintN("")
    PrintN("2nd")
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        Print(Str(map(tile_x,tile_y))+Space(4-Len( Str(map(tile_x,tile_y)) ) ) )
      Next
      PrintN("")
    Next  
    PrintN("")
    PrintN("3rd")
    For tile_y = 0 To area_height  ;store to array
      For tile_x = 0 To area_width
        Print(Str(mapTop(tile_x,tile_y))+Space(4-Len( Str(mapTop(tile_x,tile_y)) ) ) )
      Next
      PrintN("")
    Next 
Return


;- editExtraData
editExtraData:
  If OpenWindow(2,WindowX(),WindowY(), 200, 200, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "Extra Data Editor")
    exit2 = 0
    l = 5
    k = 5
    Width = 70
    Height = 20
   UseWindow(2)
   If CreateGadgetList(WindowID())
     If CreateMenu(2, WindowID())
        MenuTitle("Data")
        MenuItem(#window2, "ViewData")
        MenuItem(#window2+1, "Edit Data")
        MenuItem(#window2+2, "Add Data")
        MenuItem(#window2+3, "Delete Data")
        MenuBar()
        MenuItem(#window2+4, "Exit")
     EndIf 
   EndIf   

  Repeat
     UseWindow(0)
     If mapLoaded = 1
       Gosub drawTiles
     EndIf
     UseWindow(2)
     
     EventID2.l = WaitWindowEvent()
         
    Select EventID2

      Case #PB_EventMenu                         ; A Menu item has been selected
        Select EventMenuID()    
          Case #window2
            s$ = ""
            For k = 1 To extraDataLength
              s$ + Str(k)+": "+Str(extraData(k)&$FF)+Chr(13)
            Next
            MessageRequester("Extra Data Editor",s$,0)
           
           
          Case #window2+1
            s$ = InputRequester("Extra Data Editor","Edit Which Data: 1 to "+Str(extraDataLength),"1") 
            If Val(s$)
              k = Val(s$)
              If k >=1 And k<= extraDataLength
                s$ = InputRequester("Extra Data Editor","Input a Integer Byte","0")
                i = Val(s$)
                extraData(k) = i
              EndIf
            EndIf
          Case #window2+2
            s$ = InputRequester("Extra Data Editor","Input a Integer Byte","0")
            If Val(s$) Or s$ = "0"
               If s$ = "0"
                 i = 0
               Else 
                 i = Val(s$)
               EndIf
               Dim temp2.b(extraDataLength+1)
               For k = 0 To extraDataLength
                 temp2(k) = extraData(k)
               Next
               extraDataLength+1
               temp2(extraDataLength) = i
               Dim extraData.b(extraDataLength)
               For k = 0 To extraDataLength
                 extraData(k) = temp2(k)
               Next     
               FreeMemory(temp2)
            Else
              MessageRequester("Extra Data Editor","Invalid input",0)
            EndIf
            
          Case #window2+3
            If extraDataLength - 1 >=0
              Dim temp2.b(extraDataLength-1)
              extraDataLength-1
              For k = 0 To extraDataLength
                temp2(k) = extraData(k)
              Next
              Dim extraData.b(extraDataLength)
              For k = 0 To extraDataLength
                extraData(k) = temp2(k)
              Next     
                FreeMemory(temp2)
            EndIf
          Case #window2+4
            exit2 = 1       
            
        EndSelect 
             
      Case #PB_Event_CloseWindow
        exit2 = 1
    EndSelect
    
  Until exit2 = 1
  
   
   
  CloseWindow(2)
  If IsWindow(0)
    UseWindow(0)
  EndIf 


  EndIf
Return 

;**********************************
; 
;- TILENATOR
;
;**********************************
tilenator:
If OpenWindow(2,WindowX(),WindowY(), 660, 500, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "Tilenator")
    exit2 = 0
    l = 5
    k = 5
    Width = 70
    Height = 20
 UseWindow(2)
 If CreateGadgetList(WindowID())
   If CreateMenu(2, WindowID())
      MenuTitle("File")
        MenuItem(#window2, "Load Image")
        MenuItem(#window2+1, "Use Map Image")
        MenuBar()
        MenuItem(#window2+2, "Exit")
      
      MenuTitle("Tilenator")
        MenuItem(#window2+3, "Tilenate Image")
        MenuItem(#window2+4, "Construct Tilesheet")
        
      MenuTitle("Help")
        MenuItem(#window2+5,"Help")
   EndIf 
 EndIf 

CreateImage(#GADGET_TilenatorImage, 1, 1)
CopyImage(#GADGET_TilenatorImage, #GADGET_TilenatorImage+1) ; use this for zooming
     x = ImageWidth()
     y = ImageHeight()
If CreateGadgetList(WindowID())
  ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, x, y, 32)  
  ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(#GADGET_TilenatorImage+1)) 
EndIf 

 imageOpened = 0
     
  Repeat
     UseWindow(0)
     If mapLoaded = 1
       Gosub drawTiles
     EndIf
     If imageOpened = 1
       Gosub drawImage
     EndIf 
     UseWindow(2)
     
     EventID2.l = WaitWindowEvent()
         
    Select EventID2

      Case #PB_EventMenu                         ; A Menu item has been selected
        Select EventMenuID()    
          Case #window2
            Gosub loadImage
        
          Case #window2+1
            Gosub loadMapImage
            
          Case #window2+2
            exit2 = 1
    
          Case #window2+3
            Gosub Tilenate      
            
          Case #window2+4
            Gosub constructTileSheet
            
        EndSelect 
             
      Case #PB_Event_CloseWindow
        exit2 = 1
    EndSelect
    
  Until exit2 = 1
  
   
   
  CloseWindow(2)
  If IsWindow(0)
    UseWindow(0)

  EndIf 
  
EndIf  
Return 

;-drawImage
drawImage:
  If IsWindow(2)
    UseWindow(2) 
    If UseImage(#GADGET_TilenatorImage+1) 
    Else
      MessageRequester("Tilenator","A Tilesheet has not been loaded.",0)
    EndIf 
    SetGadgetState(#GADGET_ScrollImage,UseImage(#GADGET_TilenatorImage+1)) 
    StartDrawing(WindowOutput())
    For x = 0 To TileSheetWidth Step 32
      If x > TileSheetWidth
        Break
      EndIf 
      For y = 0 To TileSheetHeight Step 32 
        color = Point(x,y)
        color + 100
        If color > RGB(255,255,255)
          color = RGB(0,0,0)
        EndIf 
        Plot(x,y,color)
        If x > TileSheetheight
          Break
        EndIf 
      Next
    Next  
    StopDrawing()
  EndIf
Return

;- loadImage
loadImage:
fileTile$ = OpenFileRequester("Load tilesheet",fileTile$,pattern$, 5) 
If fileTile$
  If LoadImage(#GADGET_TilenatorImage,fileTile$)
    UseImage(#GADGET_TilenatorImage)
    TileSheetWidth = ImageWidth()
    TileSheetHeight = ImageHeight()
    imageOpened = 1
    fileTile$ = GetFilePart(fileTile$)
    Gosub writeTemp
    CopyImage(#GADGET_TilenatorImage,#GADGET_TilenatorImage+1)
    x = ImageWidth()
    y = ImageHeight()
    If CreateGadgetList(WindowID())
      ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, x, y, 32)  
      ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(#GADGET_TilenatorImage+1)) 
    EndIf 
  Else
    imageOpened = 0
  EndIf   
EndIf 


Return 

;- loadMapImage
loadMapImage:

CreateImage(#GADGET_TilenatorImage, area_width*imageWidth+imageWidth, area_height*imageHeight+imageHeight)
StartDrawing(ImageOutput())
  For y = 0 To area_height
    For x = 0 To area_width
      If IsImage(map(x,y) & $FF)
        UseImage(map(x,y) & $FF)
        DrawImage(ImageID(), x*imageWidth, y*imageHeight, imageWidth, ImageHeight)
      EndIf
    Next
  Next 
StopDrawing()
CopyImage(#GADGET_TilenatorImage, #GADGET_TilenatorImage+1)

x = ImageWidth()
y = ImageHeight()
If CreateGadgetList(WindowID())
  ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, x, y, 32)  
  ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(#GADGET_TilenatorImage+1)) 
EndIf 
imageOpened = 1

Return 



;- tilenate
tilenate:
; imageplugin
; #PB_ImagePlugin_BMP  : Save the image in BMP. 
; #PB_ImagePlugin_JPEG : Save the image in JPEG 
; #PB_ImagePlugin_PNG  : Save the image in PNG 
; GrabImage(#Image1, #Image2, x, y, Width, Height) 
; SaveImage(#Image2, FileName$ [, ImagePlugin [, Flags]])   flag = quality (1-10)   
If imageopened = 1
  t = 0
   
  fileTileSav$ = PathRequester("select the output directory", "") 
  Gosub writeTemp
  If fileTileSav$ 
  
  If OpenWindow(3,200,200, 200, 400, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "Tilenate SpriteSheet")
    exit3 = 0
    l = 5
    k = 5
    Width = 140
    Height = 20
    StartX = 0
    StartY = 0
    UseWindow(3)
    ActivateWindow()
    If CreateGadgetList(WindowID())
   
    TextGadget(#PB_Any, l, k, Width, Height,"Sprites Width")
    EditorGadget(#GADGET_Editor+15, l, k+20, Width, Height): SetGadgetText(#GADGET_Editor+15, "32")
    TextGadget(#PB_Any, l, k+40, Width, Height,"Sprites Height")
    EditorGadget(#GADGET_Editor+16, l, k+60, Width, Height): SetGadgetText(#GADGET_Editor+16, "32")

    TextGadget(#PB_Any, l, k+80, Width, Height,"StartX")
    EditorGadget(#GADGET_Editor+17, l, k+100, Width, Height): SetGadgetText(#GADGET_Editor+17, "0")
    TextGadget(#PB_Any, l, k+120, Width, Height,"StartY")
    EditorGadget(#GADGET_Editor+18, l, k+140, Width, Height): SetGadgetText(#GADGET_Editor+18, "0")
    
    TextGadget(#PB_Any, l, k+160, Width, Height,"X-Dev. Between Tiles")
    EditorGadget(#GADGET_Editor+19, l, k+180, Width, Height): SetGadgetText(#GADGET_Editor+19, "0")
    TextGadget(#PB_Any, l, k+200, Width, Height,"Y-Dev. Between Tiles")
    EditorGadget(#GADGET_Editor+20, l, k+220, Width, Height): SetGadgetText(#GADGET_Editor+20, "0")
    
    TextGadget(#PB_Any, l, k+240, Width, Height,"BaseName")
    EditorGadget(#GADGET_Editor+21, l, k+260, Width, Height): SetGadgetText(#GADGET_Editor+21, "")
    TextGadget(#PB_Any, l, k+280, Width, Height,"Suffix Name(Starting integer)")
    EditorGadget(#GADGET_Editor+22, l, k+300, Width, Height): SetGadgetText(#GADGET_Editor+22, "0")
   
    ButtonGadget(#GADGET_Button+19, l, k+320, Width, Height, "Done")
    EndIf 
  Repeat
     EventID3.l = WaitWindowEvent()
     Gosub drawImage
     Gosub DrawTiles
         
    Select EventID3
      Case #PB_Event_Gadget 
        Select EventGadgetID()
          Case #GADGET_Button+19
            exit3 = 1
        EndSelect
    EndSelect 
    
  Until exit3 = 1
  
  TileX = Val(GetGadgetText(#GADGET_Editor+15))
  TileY = Val(GetGadgetText(#GADGET_Editor+16))
  StartX = Val(GetGadgetText(#GADGET_Editor+17))
  StartY = Val(GetGadgetText(#GADGET_Editor+18)) 
  skipX = Val(GetGadgetText(#GADGET_Editor+19))
  skipY = Val(GetGadgetText(#GADGET_Editor+20))
  name$ = GetGadgetText(#GADGET_Editor+21)
  t = Val(GetGadgetText(#GADGET_Editor+22))
  CloseWindow(3)
  UseWindow(2)
  EndIf  
   
  ActivateWindow()               
               
  Result = MessageRequester("Tilenator", "Is The information correct?"+Chr(13)+"Output Dir: "+file$ +Chr(13)+"Width:"+Str(TileX)+"  Height:"+Str(TileY)+Chr(13)+"StartX:"+Str(StartX)+"   StartY:"+Str(StartY)+Chr(13)+"Dev.X:"+Str(skipX)+"   Dev.Y:"+Str(skipY)+Chr(13)+"base name:"+ name$, #PB_MessageRequester_YesNo)                                                
  ActivateWindow()  
  If result = 7
    Goto Tilenate
  EndIf 
               
  UseImage(#GADGET_TilenatorImage+1)
  xxx = Round(ImageWidth()/TileX,0)
  yyy = Round(ImageHeight()/TileY,0)
  For yy = 0 To yyy-1
    For xx = 0 To xxx-1
      GrabImage(#GADGET_TilenatorImage+1, #GADGET_TilenatorImage+2, StartX + xx * TileX + xx * skipX, StartY + yy * TileY + yy * skipY, TileX, TileY) 
      SaveImage( #GADGET_TilenatorImage+2, fileTileSav$ + name$ + Str(t)+".bmp")   
      t+1
    Next
  Next 
               
  EndIf
Else 
  MessageRequester("Tilenator", "a TileSheet must be loaded!", 0)
EndIf

Return 





;- constructTilesheet
constructTilesheet:

If CreateGadgetList(WindowID())
  CreateImage(#GADGET_TilenatorImage+1,1,1)
  ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, 630, 470, 32)  
  ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(#GADGET_TilenatorImage+1)) 
EndIf  
    
DirNameIn$ = PathRequester("select the input directory", fileTileSav$)
DirNameOut$ = PathRequester("select the output directory", fileTileSav$)
If DirNameIn$ And DirNameOut$            
   
      
  If OpenWindow(3,200,200, 200, 380, #PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget  , "Tilenate SpriteSheet") 
    exit3 = 0
    l = 5
    k = 5
    Width = 140
    Height = 20
    StartX = 0
    StartY = 0
    UseWindow(3)
    ActivateWindow()
    If CreateGadgetList(WindowID())
   
      TextGadget(#PB_Any, l, k, Width, Height,"Enter TileSheet Name")
      EditorGadget(#GADGET_Editor+15, l, k+20, Width, Height): SetGadgetText(#GADGET_Editor+15, "tilesheet")
      TextGadget(#PB_Any, l, k+40, Width, Height,"# of sprites per column (X)")
      EditorGadget(#GADGET_Editor+16, l, k+60, Width, Height): SetGadgetText(#GADGET_Editor+16, "10")

      TextGadget(#PB_Any, l, k+80, Width, Height,"# of sprites per row (Y)")
      EditorGadget(#GADGET_Editor+17, l, k+100, Width, Height): SetGadgetText(#GADGET_Editor+17, "10")
      TextGadget(#PB_Any, l, k+120, Width, Height,"X-Dev. Between Tiles")
      EditorGadget(#GADGET_Editor+18, l, k+140, Width, Height): SetGadgetText(#GADGET_Editor+18, "0")
    
      TextGadget(#PB_Any, l, k+160, Width, Height,"Y-Dev. Between Tiles")
      EditorGadget(#GADGET_Editor+19, l, k+180, Width, Height): SetGadgetText(#GADGET_Editor+19, "0")
   
      ButtonGadget(#GADGET_Button+19, l, k+320, Width, Height, "Done")
 
      Repeat
        EventID3.l = WaitWindowEvent()
        Gosub drawImage
        Gosub DrawTiles
         
        Select EventID3
          Case #PB_Event_Gadget 
            Select EventGadgetID()
              Case #GADGET_Button+19
                exit3 = 1
            EndSelect
        EndSelect 
    
      Until exit3 = 1
  
      fileout$ = GetGadgetText(#GADGET_Editor+15)
      xxx = Val(GetGadgetText(#GADGET_Editor+16))
      yyy = Val(GetGadgetText(#GADGET_Editor+17))
      skipX = Val(GetGadgetText(#GADGET_Editor+18)) 
      skipY = Val(GetGadgetText(#GADGET_Editor+19))
      CloseWindow(3)
      UseWindow(2) 

            
      ExamineDirectory(0, DirNameIn$, "*.bmp") 
      NextDirectoryEntry()
      If LoadImage(#GADGET_TilenatorImage+1, DirNameIn$ + DirectoryEntryName())
        width = ImageWidth()
        height = ImageHeight()
      EndIf 
     ; NextDirectoryEntry()                ; dont ask why i have to do this
             
      Result = MessageRequester("Tilenator", "Is The information correct?"+Chr(13)+"Input Dir: "+dirNameIn$ +Chr(13)+"Output Dir: "+dirNameOut$ +Chr(13)+"Width:"+Str(width)+"  Height:"+Str(Height)+Chr(13)+"Dev.X:"+Str(skipX)+"   Dev.Y:"+Str(skipY)+Chr(13)+"tiles/column: "+Str(xxx)+"   tiles\row: "+Str(yyy)+Chr(13)+"base name:"+ fileout$, #PB_MessageRequester_YesNo)                                                
      If result = 7
        Goto ConstructTileSheet
      EndIf
  
      ExamineDirectory(0, DirNameIn$, "*.bmp") 
      CreateImage(#GADGET_TilenatorImage, xxx*skipX+xxx*width, yyy*skipY+yyy*height)
      For yy =0 To yyy-1
        For xx =0 To xxx -1
          If NextDirectoryEntry() 
            If LoadImage(#GADGET_TilenatorImage+1, DirNameIn$ + DirectoryEntryName())
              UseImage(#GADGET_TilenatorImage)
              StartDrawing(ImageOutput())
                UseImage(#GADGET_TilenatorImage+1)
                DrawImage(ImageID(),xx * width + xx *skipX, yy * height + yy * skipY)
             StopDrawing()
            Else
              MessageRequester("Tilenator", "there are no more tiles to be loaded",0)
              Break 2
            EndIf
          EndIf 
        Next   
      Next  
      CopyImage(#GADGET_TilenatorImage,#GADGET_TilenatorImage+1)        
      SaveImage(#GADGET_TilenatorImage+1, DirNameOut$ + fileout$ + ".bmp")
      imageOpened = 1  
      UseImage(#GADGET_TilenatorImage+1)
      If CreateGadgetList(WindowID())
        ScrollAreaGadget(#GADGET_ScrollArea, 0, 0,640, 480, ImageWidth(), ImageHeight(), 32)  
        ImageGadget(#GADGET_ScrollImage,0,0,640, 480,UseImage(#GADGET_TilenatorImage+1)) 
      EndIf  
    EndIf       
  EndIf 
EndIf
Return
; IDE Options = PureBasic v3.94 (Windows - x86)
; UseIcon = icon.ico
; Executable = magus map maker.exe