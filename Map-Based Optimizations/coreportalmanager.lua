core:module('CorePortalManager')

local table_remove = table.remove

function PortalManager:render()
	local timerwall = TimerManager:wall()
	local t = timerwall:time()
	local dt = timerwall:delta_time()

	for _, portal in ipairs(self._portal_shapes) do
		portal:update(t, dt)
	end

	for _, group in pairs(self._unit_groups) do
		group:update(t, dt)
	end

	for _ = 1, 1000 * dt do -- has to be 300 or greater
		local unit_id, unit = next(self._hide_list)
		
		if alive(unit) then
			unit:set_visible(false)
			
			self._hide_list[unit_id] = nil
		end
	end

	while table_remove(self._check_positions) do
	end
end