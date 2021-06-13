local alive_g = alive
local ipairs_g = ipairs
local next_g = next
local table_remove = table.remove
local type_g = type

core:module('CorePortalManager')

Hooks:PostHook(PortalManager, "init", "map_optimizations_init", function(self)
	self._buffer = 0
	self._new_unit_groups = {}
end)

Hooks:PostHook(PortalManager, "clear", "map_optimizations_clear", function(self)
	self._new_unit_groups = {}
end)

Hooks:PostHook(PortalManager, "clear_unit_groups", "map_optimizations_clear_unit_groups", function(self)
	self._new_unit_groups = {}
end)

function PortalManager:render()
	local timerwall = TimerManager:wall()
	local t = timerwall:time()
	local dt = timerwall:delta_time()
	local check_positions = managers.portal:check_positions()

	local shapes = self._portal_shapes
	for i = 1, #shapes do
		shapes[i]:update(t, dt, check_positions)
	end

	local groups = self._new_unit_groups
	for i = 1, #groups do
		groups[i]:update(t, dt, check_positions)
	end

	self._buffer = self._buffer + dt * 1000 -- hide one unit for every ms that has passed since the last frame

	for _ = 1, self._buffer do
		local unit_id, unit = next_g(self._hide_list)
		
		if alive_g(unit) then
			unit:set_visible(false)
			
			self._hide_list[unit_id] = nil
		end
		
		self._buffer = self._buffer - 1
	end

	self._check_positions = {}
end

function PortalManager:check_positions()
	if #self._check_positions > 0 then
		return self._check_positions
	end

	for _, vp in ipairs_g(managers.viewport:all_really_active_viewports()) do
		local camera = vp:camera()

		if alive_g(camera) and vp:is_rendering_scene("World") then
			self._check_positions[#self._check_positions + 1] = camera:position()
		end
	end

	return self._check_positions
end

function PortalManager:add_unit_group(name)
	local group = PortalUnitGroup:new(name)
	self._unit_groups[name] = group
	self._new_unit_groups[#self._new_unit_groups + 1] = group

	return group
end

function PortalManager:remove_unit_group(name)
	self._unit_groups[name] = nil
	
	local groups = self._new_unit_groups
	for i = 1, #groups do
		if groups[i]._name == name then
			table_remove(unit_groups, i)
			break
		end
	end
end

function PortalShape:update(time, rel_time, check_positions)
	local is_inside = false

	for i = 1, #check_positions do
		is_inside = self:inside(check_positions[i])

		if is_inside then
			break
		end
	end

	if self._is_inside ~= is_inside then
		self._is_inside = is_inside
		local diff = self._is_inside and 1 or -1
		
		self:_change_units_visibility(diff)	
	end
end

function PortalShape:show_all()
	local units = self._units
	for i = 1, #units do
		if alive_g(units[i]) then
			units[i]:set_visible(true)
		end
	end
end

function PortalUnitGroup:inside(pos)
	local shapes = self._shapes
	for i = 1, #shapes do
		if shapes[i]:is_inside(pos) then
			return true
		end
	end

	return false
end

function PortalUnitGroup:update(t, dt, check_positions)
	local is_inside = false

	for i = 1, #check_positions do
		is_inside = self:inside(check_positions[i])

		if is_inside then
			break
		end
	end

	if self._is_inside ~= is_inside then
		self._is_inside = is_inside
		local diff = self._is_inside and 1 or -1

		self:_change_units_visibility(diff)
	end
end

function PortalUnitGroup:_change_units_visibility(diff)
	local units = self._units
	for i = 1, #units do
		self:_change_visibility(units[i], diff)
	end
end

function PortalUnitGroup:_change_visibility(unit, diff)
	if alive_g(unit) then
		local unit_data = unit:unit_data()
		if type_g(unit_data) == 'table' then
			local viscount = unit_data._visibility_counter
			viscount = viscount and viscount + diff or diff > 0 and 1 or 0
			unit_data._visibility_counter = viscount

			if viscount > 0 then
				unit:set_visible(true)
				managers.portal:remove_from_hide_list(unit)
			else
				managers.portal:add_to_hide_list(unit)
			end
		end
	end
end