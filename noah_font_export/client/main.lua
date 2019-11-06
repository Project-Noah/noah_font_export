local fontTable = {}

for index, font in pairs(Config.Fonts) do
	if font.FontId ~= nil and font.fontFile ~= nil then
		local fontId

		RegisterFontFile(font.fontFile)
		fontId = RegisterFontId(font.FontId)
		fontTable[index] = fontId

		Config.Fonts[index].Loaded = true
		print(('noah_font_export : Font %s loaded as id %s'):format(index, fontId))
	else
		print(('noah_font_export : Font %s failed to loaded. Because FontId or fontFile is nil'):format(index))
	end
end

function isFontLoaded(index)
	local answer = false

	if Config.Fonts[index] ~= nil then
		answer = Config.Fonts[index].Loaded
	end

	return answer
end

function RequestFontID(index)
    local answer = false

    if fontTable[index] ~= nil then
        answer = fontTable[index]
    end

    return answer
end
