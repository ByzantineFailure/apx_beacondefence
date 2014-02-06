function onInteraction(args)
	-- Spawn monster
	world.spawnMonster("serpentdroid", object.toAbsolutePosition({ 0.0, 5.0 }), { level = 10 });
end

function initializeObject()
	-- Make our object interactive (we can interract by 'Use')
	object.setInteractive(true);
	-- Change animation for state "active"
	object.setAnimationState("beaconState", "active");
end

function main()
	-- Check for the single execution
	if self.initialized == nil then
		-- Init object
		initializeObject();
		-- Set flag
		self.initialized = true;
	end
end