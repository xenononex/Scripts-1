--Target Selector
local ts
-- HERO NAME CHECK --
if myHero.charName ~= "Ryze" then return end
function ola()
   PrintChat(" >> Ryze Helper v0.1 Loaded by: Mr Freeman")
end

function OnLoad()
   --MENU
	 Config = scriptConfig("Ryze Helper", "menu")
   Config:addParam("range", "Draw Circle", SCRIPT_PARAM_ONOFF, true)
	 Config:addParam("combo", "Team Fight mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
	 Config:addParam("asf", "1v1 Mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
	 Config:addParam("asdf", "1v1 with minions around", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
	 Config:addParam("chase", "Chase Mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
	 Config:permaShow("combo")
	 Config:permaShow("asf")
	 Config:permaShow("asdf")
	 Config:permaShow("chase")
	 ola()
	
		 --Create a target selector
     ts = TargetSelector(TARGET_LOW_HP_PRIORITY,600)
end

--Circles
function OnDraw()
	if Config.range then
		DrawCircle(myHero.x, myHero.y, myHero.z, 600, 006771)
	end

--Execute 10 times per second
function OnTick()
		   --Search for enemies
			 ts:update()
	   if (ts.target ~= nil) then
		 end
			 
			 --1v1
			 if (Config.asf) then
							 --Cast Q
							 if (myHero:CanUseSpell(_Q) == READY) then
										 CastSpell(_Q, ts.target)
								end
								--Cast W
							 if (myHero:CanUseSpell(_W) == READY) then
										 CastSpell(_W, ts.target)
								end
								--Cast E
							 if (myHero:CanUseSpell(_E) == READY) then
										 CastSpell(_E, ts.target)
							  end
								--Cast R
							 if (myHero:CanUseSpell(_R) == READY) then
										 CastSpell (_R)
								end
				end
			 --Team Fight mode
			 if (Config.combo) then
							 --Cast R
							 if (myHero:CanUseSpell(_R) == READY) then
									 CastSpell (_R)
								end
							 --Cast Q
							 if (myHero:CanUseSpell(_Q) == READY) then
									 CastSpell(_Q, ts.target)
								end
							 --Cast E
							 if (myHero:CanUseSpell(_E) == READY) then
									 CastSpell(_E, ts.target)
								end
							 --Cast W
							 if (myHero:CanUseSpell(_W) == READY) then
									 CastSpell(_W, ts.target)
								end
			 end
			 --1v1 minions
			 if (Config.asdf) then
							 --Cast R
							 if (myHero:CanUseSpell(_R) == READY) then
									 CastSpell (_R)
								end
							 --Cast Q
							 if (myHero:CanUseSpell(_Q) == READY) then
									 CastSpell(_Q, ts.target)
								end
							 --Cast W
							 if (myHero:CanUseSpell(_W) == READY) then
									 CastSpell(_W, ts.target)
								end
							 --Cast E
							 if (myHero:CanUseSpell(_E) == READY) then
									 CastSpell(_E, ts.target)
								end
			 --Chase mode
			 if (Config.chase) then
						 --Cast R
						 if (myHero:CanUseSpell(_R) == READY) then
									 CastSpell (_R)
						 end
						 	 --Cast W
							 if (myHero:CanUseSpell(_W) == READY) then
									 CastSpell(_W, ts.target)
						 end
						 --Cast Q
							 if (myHero:CanUseSpell(_Q) == READY) then
									CastSpell(_Q, ts.target)
						 end
						 --Cast E
							 if (myHero:CanUseSpell(_E) == READY) then
									 CastSpell(_E, ts.target)
			 end
end
end
end
end
