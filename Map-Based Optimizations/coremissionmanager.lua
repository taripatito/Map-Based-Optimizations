core:module('CoreMissionManager')
core:import('CoreTable')

local level = Global.level_data and Global.level_data.level_id or ''
local _add_script_orig = MissionManager._add_script

-- Manipulating level scripts via lua to optimize maps is just the way i roll
-- Gotta beat TdlQ's optimizations somehow ;)

if level == 'big' then
	function MissionManager:_add_script(data)
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100004,
			editor_name = 'unload_c4',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(1900, 300, 6100),
				unit_ids = {
					100206,
					102755,
					102756,
					102759,
					102775,
					102785,
					102792,
					102799,
					102812,
					102827,
					102832,
					102838,
					102840,
					102841,
					102842,
					102844,
					102853,
					102854,
					102856,
					102863,
					102907,
					102913,
					102949,
					102966,
					102977,
					102978,
					102980,
					102985,
					102986,
					102987,
					102988,
					102989,
					102992,
					102997,
					102998,
					103001,
					103006,
					103007,
					103010,
					103015,
					103017,
					103022,
					103024,
					103026,
					103163,
					103165,
					103173,
					104102,
					104120,
					104121,
					104612,
					105686,
					105703,
					105755,
					105769,
					105770,
					105773,
					105775,
					106066,
					106067,
					106079,
					106083,
					106803,
					106807,
					106811,
					106846,
					400597,
					400686,
					400688,
					400689,
					400690,
					400691,
					400692,
					400693,
					400694,
					400696,
					400697,
					400698,
					400699,
					400700,
					400701,
					400702,
					400703,
					400704,
					400705,
					400706,
					400707,
					400708,
					400709,
					400710,
					400711,
					400712,
					400713,
					400714,
					400715,
					400716,
					400717,
					400718,
					400721,
					400722,
					400723,
					400724,
					400725,
					400726,
					400727,
					400728,
					400729,
					400730,
					400731,
					400732,
					400733,
					400734,
					400735,
					400736,
					400737,
					400738,
					400739,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100009,
			editor_name = 'unload_elevator',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(1980, 300, 6100),
				unit_ids = {
					100205,
					101462,
					101476,
					101482,
					101507,
					101513,
					101536,
					101547,
					102970,
					103096,
					103121,
					103132,
					103134,
					103183,
					103379,
					103382,
					103385,
					103386,
					103387,
					103388,
					103560,
					103562,
					103565,
					103566,
					103581,
					103593,
					103595,
					103596,
					105470,
					106960,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100031,
			editor_name = 'unload_bus',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(2060, 300, 6100),
				unit_ids = {
					100691,
					103190,
					103195,
					103197,
					103200,
					103459,
					103762,
					103878,
					104008,
					104123,
					105679,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100038,
			editor_name = 'unload_sideroom',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(-1500, 1100, -600),
				unit_ids = {
					101792,
					101937,
					103545,
					103557,
					106185,
					106188,
					106197,
					106199,
					106200,
					106203,
					106205,
					106206,
					106207,
					106208,
					106211,
					106213,
					106215,
					106216,
					106217,
					106221,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100039,
			editor_name = 'unload_sideroom_2',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(-1700, -1600, -600),
				unit_ids = {
					400538,
					400539,
					400540,
					400541,
					400542,
					400543,
					400544,
					400548,
					400549,
					400551,
					400552,
					400553,
					400554,
					400555,
					400556,
					400557,
					400558,
					400561,
					400562,
					400566,
					400567,
					400569,
					400570,
					400571,
					400572,
					400573,
					400574,
					400575,
					400576,
					400577,
					400580,
					400581,
					400582,
					400584,
					400586,
					400588,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100040,
			editor_name = 'unload_server_room_1',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(650, 1250, -1000),
				unit_ids = {
					102613,
					104586,
					105264,
					400342,
					400458,
					400467,
					400468,
					400470,
					400473,
					400474,
					400475,
					400478,
					400479,
					400480,
					400481,
					400484,
					400486,
					400487,
					400491,
					400492,
					400493,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100041,
			editor_name = 'unload_server_room_2',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(1400, -2100, -1000),
				unit_ids = {
					101290,
					102931,
					103158,
					400339,
					400340,
					400346,
					400459,
					400460,
					400461,
					400462,
					400463,
					400465,
					400469,
					400472,
					400476,
					400477,
					400482,
					400483,
					400485,
					400488,
					400489,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100042,
			editor_name = 'unload_server_room_3',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(200, -1300, -600),
				unit_ids = {
					102471,
					105258,
					105262,
					400497,
					400499,
					400501,
					400502,
					400503,
					400506,
					400507,
					400508,
					400509,
					400512,
					400514,
					400516,
					400517,
					400518,
					400519,
					400520,
					400525,
					400527,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100043,
			editor_name = 'unload_security_room_1',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(-3850, 1400, -1000),
				unit_ids = {
					103481,
					103758,
					400646,
					400647,
					400648,
					400650,
					400651,
					400652,
					400653,
					400654,
					400655,
					400656,
					400661,
					400662,
					400663,
					400664,
					400665,
					400666,
					400667,
					400668,
					400669,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100044,
			editor_name = 'unload_security_room_2',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(-2650, 1680, -600),
				unit_ids = {
					105159,
					106017,
					400578,
					400585,
					400587,
					400589,
					400590,
					400591,
					400592,
					400593,
					400594,
					400595,
					400598,
					400600,
					400601,
					400602,
					400608,
					400609,
					400613,
					400614,
					400615,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		table.insert(data.elements, {
			class = 'ElementUnloadStatic',
			id = 100045,
			editor_name = 'unload_security_room_3',
			values = {
				execute_on_startup = false,
				rotation = Rotation(0, 0, -0),
				position = Vector3(-3000, -2070, -600),
				unit_ids = {
					101491,
					103378,
					400619,
					400621,
					400622,
					400625,
					400627,
					400628,
					400629,
					400630,
					400631,
					400634,
					400635,
					400637,
					400639,
					400640,
					400641,
					400642,
					400643,
					400644,
					400645,
				},
				on_executed = {},
				enabled = true,
				base_delay = 0,
				trigger_times = 0
			}
		})
		
		--[[
			100004 = C4 Escape Unload
			100009 = Elevator Escape Unload
			100031 = Bus Escape Unload
			100038 = Sideroom 1 Unload
			100039 = Sideroom 2 Unload
			100040 = Server Room 1 Unload
			100041 = Server Room 2 Unload
			100042 = Server Room 3 Unload
			100043 = Security Room 1 Unload
			100044 = Security Room 2 Unload
			100045 = Security Room 3 Unload
		--]]
	
		for _, element in pairs(data.elements) do
			if element.id == 106592 and element.editor_name == 'pp_esc_elevator001' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100004,
					alternative = 'any'
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100031,
					alternative = 'any'
				})
			elseif element.id == 106593 and element.editor_name == 'pp_esc_bus001' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100004,
					alternative = 'any'
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100009,
					alternative = 'any'
				})
			elseif element.id == 106594 and element.editor_name == 'pp_esc_c4001' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100009,
					alternative = 'any'
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100031,
					alternative = 'any'
				})
			elseif element.id == 104305 and element.editor_name == 'pp_escape_heli' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100004,
					alternative = 'any'
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100009,
					alternative = 'any'
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100031,
					alternative = 'any'
				})
			elseif element.id == 103730 and element.editor_name == 'logic_chance_trigger_003' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100038
				})
			elseif element.id == 101429 and element.editor_name == 'disable_doors' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100039
				})		
			elseif element.id == 104590 and element.editor_name == 'server_room_001' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100041
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100042
				})					
			elseif element.id == 104591 and element.editor_name == 'server_room_002' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100040
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100042
				})	
			elseif element.id == 104592 and element.editor_name == 'server_room_003' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100040
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100041
				})
			elseif element.id == 100699 and element.editor_name == 'surv_room001' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100044
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100045
				})
			elseif element.id == 100700 and element.editor_name == 'surv_room002' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100043
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100045
				})
			elseif element.id == 100701 and element.editor_name == 'surv_room003' then
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100043
				})
				table.insert(element.values.on_executed, {
					delay = 0,
					id = 100044
				})
			end
		end
		
		_add_script_orig(self, data)
	end
end
