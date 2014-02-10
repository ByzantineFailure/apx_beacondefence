function DrawPixel(x, y)
	world.placeMaterial(entity.toAbsolutePosition( { x, y} ), "background", "glass")
	world.placeMaterial(entity.toAbsolutePosition( { x, y} ), "foreground", "glass")
end

function DrawPixel2(x, y)
	world.placeMaterial(entity.toAbsolutePosition( { x, y} ), "background", "glass")
end


function buildDome(side)
	world.logInfo("Flooding Area");	
	for column = -1, side-1, 1 do --outer loop. Each iteration will flood one column.
		
		--first, we get the height--
		-- height = world.collisionBlocksAlongLine(entity.toAbsolutePosition( { column, 0} ), entity.toAbsolutePosition( { column, side} ))
		height = world.collisionBlocksAlongLine(entity.toAbsolutePosition( { column, 0} ), entity.toAbsolutePosition( { column, side} ))
		current_pos = entity.position()
		
		height_adjust = height[1][2] - current_pos[2]
		world.logInfo("Column: "..column..", Height: "..height_adjust)
		if height_adjust == 0 then
			break
		end
		--now we flood up to the height--
		for top = 0, height_adjust, 1 do
			DrawPixel2(column, top)
		end
		
		--next column
	end
	

	self.runOnce = 2
end

function main()
	if self.runOnce == 1 then

		buildDome(200)
	end
end

function init()
  --variable to determine when the device has run.
  self.runOnce = 1
end