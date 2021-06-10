if not _G.MBO.settings.improved_portals then
	return
end

core:module('CorePortalManager')

Hooks:PostHook(PortalManager, "init", "map_optimizations_init", function(self)
	self._buffer = 0
end)

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

	self._buffer = self._buffer + dt * 1000 -- 1000 per second, previous iteration could deviate by 25%

	for _ = 1, self._buffer do
		local unit_id, unit = next(self._hide_list)
		
		if alive(unit) then
			unit:set_visible(false)
			
			self._hide_list[unit_id] = nil
		end
		
		self._buffer = self._buffer - 1
	end

	self._check_positions = {}
end