local fontTable = {}

function trace(text)
     trace('noah_font_export: %s', text)
end

for index, font in pairs(Config.Fonts) do
     if font.FontId ~= nil and font.fontFile ~= nil then
          Citizen.CreateThread(function()
               local fontId

               RegisterFontFile(font.fontFile)
               fontId = RegisterFontId(font.FontId)
               fontTable[index] = fontId

               font.Loaded = true
               trace(('Font %s loaded as id %s'):format(index, fontId))
          end)
     else
          trace(('Font %s failed to loaded. Because FontIf or fontFile is nil'):format(index))
     end
end

function isFontLoaded(index)
     local answer = false

     if Config.Fonts.index ~= nil then
          answer = Config.Fonts.index.Loaded
     end

     return answer
end

function RequestFontID(index)
     local answer = false

     if font[index] ~= nil then
          answer = font[index]
     end

     return answer
end