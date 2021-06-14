local alive_g = alive

function _OcclusionManager:remove_occlusion(unit)
	if alive_g(unit) then
		local objects = unit:get_objects_by_type(self._model_ids)

		for i = 1, #objects do
			objects[i]:set_skip_occlusion(true)
		end
	end

	self._skip_occlusion[unit:key()] = true
end

function _OcclusionManager:add_occlusion(unit)
	if alive_g(unit) then
		local objects = unit:get_objects_by_type(self._model_ids)
		
		for i = 1, #objects do
			objects[i]:set_skip_occlusion(false)
		end
	end

	self._skip_occlusion[unit:key()] = nil
end