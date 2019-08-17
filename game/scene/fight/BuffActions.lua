local Attr = require "game.scene.fight.Attr"
local BuffActions = {}

function BuffActions:Init(  )
	self.actions = {}		

	--属性 Buff：增加或减少万分之 x 属性 n 毫秒
	self.actions[400000] = function( cfg )
		return Attr { duration=cfg.duration, attr_id=cfg.attr_id, value=cfg.value, is_percent=cfg.is_percent }
		-- return Attr(cfg)--todo : readonly
	end

	--吸血 buff
	self.actions[400001] = function( cfg )
		return Repeat {-1, 
				Sequence { 
					HP {100},
					Delay {700} 
				}
			}
	end

	--晕眩 buff
	self.actions[400002] = function( cfg )
		return Dizzy { cfg }
	end

	--回血 buff
	self.actions[400003] = function( cfg )
		return Repeat {-1, 
				Sequence { 
					HP {100},
					Delay {700} 
				}
			}
	end

end

function BuffActions:GetActionCreator( buffID )
	return self.actions[buffID]
end

return BuffActions