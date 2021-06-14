Hooks:PostHook(WorldHolder, "create_world", "map_optimizations_create_world", function(self)
	if MBO.settings.remove_occluder_limit then
		World:occlusion_manager():set_max_occluder_tests(1000) -- epic
	else
		World:occlusion_manager():set_max_occluder_tests(5) -- epicn't
	end
end)