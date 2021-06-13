Hooks:Add("LocalizationManagerPostInit", "MBO_LocalizationManagerPostInit", function( loc )
	loc:load_localization_file(MBO.loc_path)
end)

Hooks:Add( "MenuManagerInitialize", "MBO_MenuManagerInitialize", function(menu_manager)
	MenuCallbackHandler.MBO_check_clbk = function(this, item)
		MBO.settings[item:name()] = item:value() == 'on'
	end

	MenuCallbackHandler.MBO_callback_options_closed = function(self)
		MBO:save()
	end

	MBO:load()
	MenuHelper:LoadFromJsonFile(MBO.options_path, MBO, MBO.settings)
end)