local library = {


	toggle = true,


	firstTab = nil,


	tabCount = 0,


	colorTable = {},


}



local rs = game:GetService('RunService')


local http = game:GetService('HttpService')


local ts = game:GetService('TweenService')


local uis = game:GetService('UserInputService')



local drag = function(topObj,obj)


	local dragging = nil


	local dragInput = nil


	local dragStart = nil


	local startPos = nil



	topObj.InputBegan:Connect(function(input)


		if input.UserInputType == Enum.UserInputType.MouseButton1 then


			dragging = true


			dragStart = input.Position


			startPos = obj.Position



			input.Changed:Connect(function()


				if input.UserInputState == Enum.UserInputState.End then


					dragging = false


				end


			end)


		end


	end)



	topObj.InputChanged:Connect(function(input)


		if input.UserInputType == Enum.UserInputType.MouseMovement then


			dragInput = input


		end


	end)



	uis.InputChanged:Connect(function(input)


		if dragging and input == dragInput then


			local x = input.Position - dragStart


			obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + x.X, startPos.Y.Scale, startPos.Y.Offset + x.Y)


		end


	end)


end



function library:createWindow(cfg,parent)


	local windowInit = {}



	local sgui = Instance.new('ScreenGui',parent)

	syn.protect_gui(sgui)


	sgui.Name = http:GenerateGUID(false)


	sgui.IgnoreGuiInset = true


	sgui.ZIndexBehavior = Enum.ZIndexBehavior.Global



	local main = Instance.new('Frame',sgui)


	main.AnchorPoint = Vector2.new(0.5,0.5)


	main.BackgroundColor3 = Color3.fromRGB(25,25,25)


	main.BackgroundTransparency = 1


	main.BorderColor3 = Color3.fromRGB(0,0,0)


	main.BorderSizePixel = 0


	main.Position = UDim2.new(0.5,0,0.5,0)


	main.Size = UDim2.new(0,700,0,400)


	main.ZIndex = 1


	


	uis.InputBegan:Connect(function(input,typing)


		if not typing and input.KeyCode == Enum.KeyCode.RightControl then


			main.Visible = not main.Visible


		end


	end)


	


	local mainBorder = Instance.new('Frame',main)


	mainBorder.AnchorPoint = Vector2.new(0.5,0.5)


	mainBorder.BackgroundColor3 = Color3.fromRGB(50,50,50)


	mainBorder.BackgroundTransparency = 0


	mainBorder.BorderColor3 = Color3.fromRGB(0,0,0)


	mainBorder.BorderSizePixel = 1


	mainBorder.Position = UDim2.new(0.5,0,0.5,0)


	mainBorder.Size = UDim2.new(1,2,1,2)


	mainBorder.ZIndex = 0



	local topbar = Instance.new('Frame',main)


	topbar.AnchorPoint = Vector2.new(0.5,0)


	topbar.BackgroundColor3 = Color3.fromRGB(25,25,25)


	topbar.BackgroundTransparency = 1


	topbar.BorderColor3 = Color3.fromRGB(0,0,0)


	topbar.BorderSizePixel = 0


	topbar.Position = UDim2.new(0.5,0,0,0)


	topbar.Size = UDim2.new(1,-10,0,20)


	topbar.ZIndex = 2



	local libraryTitle = Instance.new('TextLabel',topbar)


	libraryTitle.AnchorPoint = Vector2.new(0,0)


	libraryTitle.BackgroundColor3 = Color3.fromRGB(25,25,25)


	libraryTitle.BackgroundTransparency = 1


	libraryTitle.BorderColor3 = Color3.fromRGB(0,0,0)


	libraryTitle.BorderSizePixel = 0


	libraryTitle.Position = UDim2.new(0,0,0,0)


	libraryTitle.Size = UDim2.new(0,345,1,0)


	libraryTitle.ZIndex = 2


	libraryTitle.Font = Enum.Font.SourceSansSemibold


	libraryTitle.Text = cfg.windowName


	libraryTitle.TextColor3 = Color3.fromRGB(200,200,200)


	libraryTitle.TextSize = 15


	libraryTitle.TextStrokeColor3 = Color3.fromRGB(0,0,0)


	libraryTitle.TextStrokeTransparency = 0.75


	libraryTitle.TextXAlignment = Enum.TextXAlignment.Left



	local libraryName = Instance.new('TextLabel',topbar)


	libraryName.AnchorPoint = Vector2.new(0,0)


	libraryName.BackgroundColor3 = Color3.fromRGB(25,25,25)


	libraryName.BackgroundTransparency = 1


	libraryName.BorderColor3 = Color3.fromRGB(0,0,0)


	libraryName.BorderSizePixel = 0


	libraryName.Position = UDim2.new(0,345,0,0)


	libraryName.Size = UDim2.new(0,345,1,0)


	libraryName.ZIndex = 2


	libraryName.Font = Enum.Font.SourceSansSemibold


	libraryName.Text = 'lystra.cc'


	libraryName.TextColor3 = Color3.fromRGB(75,75,75)


	libraryName.TextSize = 15


	libraryName.TextStrokeColor3 = Color3.fromRGB(0,0,0)


	libraryName.TextStrokeTransparency = 0.75


	libraryName.TextXAlignment = Enum.TextXAlignment.Right



	local tbContainer = Instance.new('Frame',main)


	tbContainer.AnchorPoint = Vector2.new(0,0)


	tbContainer.BackgroundColor3 = Color3.fromRGB(25,25,25)


	tbContainer.BackgroundTransparency = 0


	tbContainer.BorderColor3 = Color3.fromRGB(0,0,0)


	tbContainer.BorderSizePixel = 0


	tbContainer.Position = UDim2.new(0,5,0,25)


	tbContainer.Size = UDim2.new(0,200,1,-30)


	tbContainer.ZIndex = 3



	local tbContainerBorder = mainBorder:Clone()


	tbContainerBorder.Parent = tbContainer


	tbContainerBorder.ZIndex = 2



	local tbContainerHolder = Instance.new('Frame',tbContainer)


	tbContainerHolder.AnchorPoint = Vector2.new(0.5,0.5)


	tbContainerHolder.BackgroundColor3 = Color3.fromRGB(25,25,25)


	tbContainerHolder.BackgroundTransparency = 1


	tbContainerHolder.BorderColor3 = Color3.fromRGB(0,0,0)


	tbContainerHolder.BorderSizePixel = 0


	tbContainerHolder.Position = UDim2.new(0.5,0,0.5,0)


	tbContainerHolder.Size = UDim2.new(1,0,1,0)


	tbContainerHolder.ZIndex = 3


	tbContainerHolder.ClipsDescendants = true



	local tbContainerHolderList = Instance.new('UIListLayout',tbContainerHolder)


	tbContainerHolderList.Padding = UDim.new(0,7)


	tbContainerHolderList.FillDirection = Enum.FillDirection.Vertical


	tbContainerHolderList.HorizontalAlignment = Enum.HorizontalAlignment.Center



	local tbContainerHolderPadding = Instance.new('UIPadding',tbContainerHolder)


	tbContainerHolderPadding.PaddingTop = UDim.new(0,5)



	local tContainer = Instance.new('Frame',main)


	tContainer.AnchorPoint = Vector2.new(0,0)


	tContainer.BackgroundColor3 = Color3.fromRGB(25,25,25)


	tContainer.BackgroundTransparency = 0


	tContainer.BorderColor3 = Color3.fromRGB(0,0,0)


	tContainer.BorderSizePixel = 0


	tContainer.Position = UDim2.new(0,210,0,25)


	tContainer.Size = UDim2.new(0,485,1,-30)


	tContainer.ZIndex = 3



	local tContainerBorder = mainBorder:Clone()


	tContainerBorder.Parent = tContainer


	tContainerBorder.ZIndex = 2



	drag(topbar,main)



	local function closeAll()


		for _,v in pairs(tContainer:GetChildren()) do


			if v:IsA('ScrollingFrame') then


				v.Visible = false


			end


		end


	end



	local function resetAll()


		for _,v in pairs(tbContainerHolder:GetChildren()) do


			if v:IsA('TextButton') then


				v.BackgroundColor3 = Color3.fromRGB(50,50,50)


			end


		end


		for _,v in pairs(tbContainerHolder:GetChildren()) do


			if v:IsA('TextButton') then


				v.Size = UDim2.new(1,-10,0,25)


			end


		end


	end



	local function keepFirst()


		for _,v in pairs(tContainer:GetChildren()) do


			if v:IsA('ScrollingFrame') then


				if v.Name == library.firstTab..' T' then


					v.Visible = true


				else


					v.Visible = false


				end


			end


		end


		for _,v in pairs(tbContainerHolder:GetChildren()) do


			if v:IsA('TextButton') then


				if v.Name == library.firstTab..' TB' then


					v.BackgroundColor3 = cfg.color


				else


					v.BackgroundColor3 = Color3.fromRGB(50,50,50)


				end


			end


		end


	end



	local function toggle(state)


		if state then


			main.Visible = true


		elseif not state then


			for _,v in pairs(sgui:GetChildren()) do


				if v:IsA('Frame') and v.Name ~= main.Name then


					v.Visible = false


				end


			end


			main.Visible = false


		end


		library.toggle = state


	end



	local function changeColor(color)


		cfg.color = color


		for _,v in pairs(library.colorTable) do


			if v.BackgroundColor3 ~= Color3.fromRGB(50,50,50) then


				v.BackgroundColor3 = color


			end


		end


	end



	function windowInit:toggle(state)


		toggle(state)


	end



	function windowInit:changeColor(color)


		changeColor(color)


	end



	function windowInit:createTab(name)


		local tInit = {}



		local t = Instance.new('ScrollingFrame',tContainer)


		t.Name = name..' T'


		t.AnchorPoint = Vector2.new(0.5,0.5)


		t.BackgroundColor3 = Color3.fromRGB(25,25,25)


		t.BackgroundTransparency = 1


		t.BorderColor3 = Color3.fromRGB(0,0,0)


		t.BorderSizePixel = 0


		t.Position = UDim2.new(0.5,0,0.5,0)


		t.Size = UDim2.new(1,0,1,0)


		t.ZIndex = 5


		t.ClipsDescendants = true


		t.BottomImage = 'rbxassetid://6432766838'


		t.CanvasPosition = Vector2.new(0,0)


		t.CanvasSize = UDim2.new(0,0,0,0)


		t.ElasticBehavior = Enum.ElasticBehavior.Never


		t.MidImage = 'rbxassetid://6432766838'


		t.ScrollBarImageColor3 = Color3.fromRGB(50,50,50)


		t.ScrollBarThickness = 1


		t.ScrollingDirection = Enum.ScrollingDirection.Y


		t.TopImage = 'rbxassetid://6432766838'



		local tLeft = Instance.new('Frame',t)


		tLeft.AnchorPoint = Vector2.new(0,0)


		tLeft.BackgroundColor3 = Color3.fromRGB(25,25,25)


		tLeft.BackgroundTransparency = 1


		tLeft.BorderColor3 = Color3.fromRGB(0,0,0)


		tLeft.BorderSizePixel = 0


		tLeft.Position = UDim2.new(0,5,0,0)


		tLeft.Size = UDim2.new(0,235,1,0)


		tLeft.ZIndex = 2



		local tLeftList = Instance.new('UIListLayout',tLeft)


		tLeftList.Padding = UDim.new(0,10)


		tLeftList.FillDirection = Enum.FillDirection.Vertical


		tLeftList.HorizontalAlignment = Enum.HorizontalAlignment.Center



		local tLeftPadding = Instance.new('UIPadding',tLeft)


		tLeftPadding.PaddingTop = UDim.new(0,10)



		local tRight = Instance.new('Frame',t)


		tRight.AnchorPoint = Vector2.new(1,0)


		tRight.BackgroundColor3 = Color3.fromRGB(25,25,25)


		tRight.BackgroundTransparency = 1


		tRight.BorderColor3 = Color3.fromRGB(0,0,0)


		tRight.BorderSizePixel = 0


		tRight.Position = UDim2.new(1,-5,0,0)


		tRight.Size = UDim2.new(0,235,1,0)


		tRight.ZIndex = 2



		local tRightList = Instance.new('UIListLayout',tRight)


		tRightList.Padding = UDim.new(0,10)


		tRightList.FillDirection = Enum.FillDirection.Vertical


		tRightList.HorizontalAlignment = Enum.HorizontalAlignment.Center



		local tRightPadding = Instance.new('UIPadding',tRight)


		tRightPadding.PaddingTop = UDim.new(0,10)



		local tb = Instance.new('TextButton',tbContainerHolder)


		tb.Name = name..' TB'


		tb.AnchorPoint = Vector2.new(0,0)


		tb.AutoButtonColor = false


		tb.BackgroundColor3 = cfg.color


		tb.BackgroundTransparency = 0


		tb.BorderColor3 = Color3.fromRGB(0,0,0)


		tb.BorderSizePixel = 0


		tb.Position = UDim2.new(0,0,0,0)


		tb.Size = UDim2.new(0,190,0,25)


		tb.ZIndex = 4


		tb.Font = Enum.Font.SourceSansSemibold


		tb.Text = ''


		tb.TextColor3 = Color3.fromRGB(200,200,200)


		tb.TextSize = 15


		tb.TextStrokeColor3 = Color3.fromRGB(0,0,0)


		tb.TextStrokeTransparency = 0.75


		


		local tbTitle = Instance.new('TextLabel',tb)


		tbTitle.AnchorPoint = Vector2.new(0.5,0.5)


		tbTitle.BackgroundTransparency = 1


		tbTitle.Position = UDim2.new(0.5,0,0.5,0)


		tbTitle.Size = UDim2.new(1,-10,1,0)


		tbTitle.ZIndex = 5


		tbTitle.Font = Enum.Font.SourceSansSemibold


		tbTitle.Text = name


		tbTitle.TextColor3 = Color3.fromRGB(200,200,200)


		tbTitle.TextSize = 15


		tbTitle.TextStrokeColor3 = Color3.fromRGB(0,0,0)


		tbTitle.TextStrokeTransparency = 0.75


		


		local tbBorder = mainBorder:Clone()


		tbBorder.Parent = tb


		tbBorder.ZIndex = 3


		


		local tbGradient = Instance.new('UIGradient',tb)


		tbGradient.Color = ColorSequence.new{


			ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),


			ColorSequenceKeypoint.new(1,Color3.fromRGB(180,180,180))


		}


		tbGradient.Rotation = 90


		


		table.insert(library.colorTable, tb)


		


		library.tabCount = library.tabCount + 1


		if library.tabCount == 1 then


			library.firstTab = name


		end



		closeAll()


		resetAll()


		keepFirst()



		local function getSide(longest)


			if longest then


				if tLeftList.AbsoluteContentSize.Y > tRightList.AbsoluteContentSize.Y then


					return tLeft


				else


					return tRight


				end


			else


				if tLeftList.AbsoluteContentSize.Y > tRightList.AbsoluteContentSize.Y then


					return tRight


				else


					return tLeft


				end


			end


		end



		tb.MouseButton1Click:Connect(function()


			closeAll()


			resetAll()


			t.Visible = true


			tb.BackgroundColor3 = cfg.color


			--tb.BackgroundTransparency = 0


		end)



		tLeftList:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()


			if getSide(true).Name == tLeft.Name then


				t.CanvasSize = UDim2.new(0,0,0,tLeftList.AbsoluteContentSize.Y+10)


			else


				t.CanvasSize = UDim2.new(0,0,0,tRightList.AbsoluteContentSize.Y+10)


			end


		end)



		tRightList:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()


			if getSide(true).Name == tLeft.Name then


				t.CanvasSize = UDim2.new(0,0,0,tLeftList.AbsoluteContentSize.Y+10)


			else


				t.CanvasSize = UDim2.new(0,0,0,tRightList.AbsoluteContentSize.Y+10)


			end


		end)



		function tInit:createSection(name)


			local sectionInit = {}



			local section = Instance.new('Frame',getSide(false))


			section.Name = name..' S'


			section.AnchorPoint = Vector2.new(0,0)


			section.BackgroundColor3 = Color3.fromRGB(25,25,25)


			section.BorderSizePixel = 0


			section.Size = UDim2.new(1,0,0,235)


			section.ZIndex = 6



			local sectionBorder = mainBorder:Clone()


			sectionBorder.Parent = section


			sectionBorder.ZIndex = 5



			local sectionTitle = Instance.new('TextLabel',section)


			sectionTitle.BackgroundColor3 = Color3.fromRGB(25,25,25)


			sectionTitle.BorderSizePixel = 0


			sectionTitle.Position = UDim2.new(0,5,0,-2)


			sectionTitle.ZIndex = 6


			sectionTitle.Font = Enum.Font.SourceSansSemibold


			sectionTitle.Text = name


			sectionTitle.TextColor3 = Color3.fromRGB(200,200,200)


			sectionTitle.TextSize = 15


			sectionTitle.TextStrokeTransparency = 0.75


			sectionTitle.Size = UDim2.new(0,sectionTitle.TextBounds.X+10,0,2)



			local sectionContainer = Instance.new('Frame',section)


			sectionContainer.AnchorPoint = Vector2.new(0.5,0)


			sectionContainer.BackgroundTransparency = 1


			sectionContainer.Position = UDim2.new(0.5,0,0,10)


			sectionContainer.Size = UDim2.new(1,0,1,-10)


			sectionContainer.ZIndex = 6



			local sectionContainerList = Instance.new('UIListLayout',sectionContainer)


			sectionContainerList.Padding = UDim.new(0,5)


			sectionContainerList.FillDirection = Enum.FillDirection.Vertical


			sectionContainerList.HorizontalAlignment = Enum.HorizontalAlignment.Center



			sectionContainerList:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()


				section.Size = UDim2.new(1,0,0,sectionContainerList.AbsoluteContentSize.Y+15)


			end)



			function sectionInit:createLabel(name)


				local label = Instance.new('TextLabel',sectionContainer)


				label.Name = name..' L'


				label.BackgroundTransparency = 1


				label.ZIndex = 7


				label.Font = Enum.Font.SourceSansSemibold


				label.Text = name


				label.TextColor3 = Color3.fromRGB(200,200,200)


				label.TextSize = 15


				label.TextStrokeTransparency = 0.75


				label.Size = UDim2.new(1,-10,0,label.TextBounds.Y)


			end



			function sectionInit:createButton(name,callback)


				local buttonInit = {}



				local button = Instance.new('TextButton',sectionContainer)


				button.Name = name..' B'


				button.AutoButtonColor = false


				button.BackgroundColor3 = Color3.fromRGB(50,50,50)


				button.BorderSizePixel = 0


				button.ZIndex = 7


				button.Text = ''


				


				local buttonTitle = Instance.new('TextLabel',button)


				buttonTitle.BackgroundTransparency = 1


				buttonTitle.Size = UDim2.new(1,0,1,0)


				buttonTitle.ZIndex = 7


				buttonTitle.Font = Enum.Font.SourceSansSemibold


				buttonTitle.Text = name


				buttonTitle.TextColor3 = Color3.fromRGB(200,200,200)


				buttonTitle.TextSize = 15


				buttonTitle.TextStrokeTransparency = 0.75


				


				button.Size = UDim2.new(1,-10,0,buttonTitle.TextBounds.Y+5)



				local buttonBorder = mainBorder:Clone()


				buttonBorder.Parent = button


				buttonBorder.ZIndex = 6



				local buttonGradient = tbGradient:Clone()


				buttonGradient.Parent = button



				table.insert(library.colorTable,button)



				button.MouseButton1Down:Connect(function()


					button.BackgroundColor3 = cfg.color


				end)



				button.MouseButton1Up:Connect(function()


					button.BackgroundColor3 = Color3.fromRGB(50,50,50)


				end)



				button.MouseLeave:Connect(function()


					button.BackgroundColor3 = Color3.fromRGB(50,50,50)


				end)



				button.MouseButton1Click:Connect(function()


					callback()


				end)



				return buttonInit


			end



			function sectionInit:createToggle(name,default,callback)


				local defaultLocal = default or false


				local toggleInit = {}



				local toggle = Instance.new('TextButton',sectionContainer)


				toggle.Name = name..' T'


				toggle.AutoButtonColor = false


				toggle.BackgroundTransparency = 1


				toggle.ZIndex = 7


				toggle.Text = ''



				local toggleTitle = Instance.new('TextLabel',toggle)


				toggleTitle.AnchorPoint = Vector2.new(0,0.5)


				toggleTitle.BackgroundTransparency = 1


				toggleTitle.Position = UDim2.new(0,15,0.5,0)


				toggleTitle.Size = UDim2.new(1,-66,1,0)


				toggleTitle.ZIndex = 6


				toggleTitle.Font = Enum.Font.SourceSansSemibold


				toggleTitle.Text = name


				toggleTitle.TextColor3 = Color3.fromRGB(200,200,200)


				toggleTitle.TextSize = 15


				toggleTitle.TextStrokeTransparency = 0.75


				toggleTitle.TextXAlignment = Enum.TextXAlignment.Left



				toggle.Size = UDim2.new(1,-10,0,toggleTitle.TextBounds.Y+5)



				local toggleMain = Instance.new('Frame',toggle)


				toggleMain.AnchorPoint = Vector2.new(0,0.5)


				toggleMain.BackgroundColor3 = Color3.fromRGB(50,50,50)


				toggleMain.BorderSizePixel = 0


				toggleMain.Position = UDim2.new(0,0,0.5,0)


				toggleMain.Size = UDim2.new(0,10,0,10)


				toggleMain.ZIndex = 6



				local toggleMainBorder = mainBorder:Clone()


				toggleMainBorder.Parent = toggleMain


				toggleMainBorder.ZIndex = 5



				local toggleMainGradient = tbGradient:Clone()


				toggleMainGradient.Parent = toggleMain



				table.insert(library.colorTable,toggleMain)


				


				local toggleState = false



				local function setState(state)


					if state then


						toggleMain.BackgroundColor3 = cfg.color


					elseif not state then


						toggleMain.BackgroundColor3 = Color3.fromRGB(50,50,50)


					end


					toggleState = state


					callback(state)


				end



				toggle.MouseButton1Click:Connect(function()


					toggleState = not toggleState


					setState(toggleState)


				end)



				if default == nil then


					function toggleInit:setState(state)


						setState(state)


					end


				else


					setState(defaultLocal)


				end



				function toggleInit:getState(state)


					return toggleState


				end



				return toggleInit


			end



			function sectionInit:createSlider(name,min,max,default,precise,callback)


				local defaultLocal = default or 50


				local sliderInit = {}



				local slider = Instance.new('TextButton',sectionContainer)


				slider.Name = name..' S'


				slider.AutoButtonColor = false


				slider.BackgroundTransparency = 1


				slider.ZIndex = 7


				slider.Text = ''



				local sliderTitle = Instance.new('TextLabel',slider)


				sliderTitle.BackgroundTransparency = 1


				sliderTitle.Position = UDim2.new(0,0,0,10)


				sliderTitle.ZIndex = 7


				sliderTitle.Font = Enum.Font.SourceSansSemibold


				sliderTitle.Text = name


				sliderTitle.TextColor3 = Color3.fromRGB(200,200,200)


				sliderTitle.TextSize = 15


				sliderTitle.TextStrokeTransparency = 0.75


				sliderTitle.TextXAlignment = Enum.TextXAlignment.Left



				sliderTitle.Size = UDim2.new(1,-10,0,sliderTitle.TextBounds.Y+15)


				slider.Size = UDim2.new(1,-10,0,sliderTitle.TextBounds.Y+15)



				local sliderValue = Instance.new('TextBox',slider)


				sliderValue.AnchorPoint = Vector2.new(0,1)


				sliderValue.BackgroundTransparency = 1


				sliderValue.Position = UDim2.new(0,0,1,-10)


				sliderValue.Size = UDim2.new(1,0,0,20)


				sliderValue.ZIndex = 7


				sliderValue.Font = Enum.Font.SourceSansSemibold


				sliderValue.PlaceholderColor3 = Color3.fromRGB(150,150,150)


				sliderValue.PlaceholderText = tostring(min/max)


				sliderValue.Text = ''


				sliderValue.TextColor3 = Color3.fromRGB(200,200,200)


				sliderValue.TextSize = 15


				sliderValue.TextStrokeTransparency = 0.75


				sliderValue.TextXAlignment = Enum.TextXAlignment.Right



				local sliderMain = Instance.new('Frame',slider)


				sliderMain.AnchorPoint = Vector2.new(0,1)


				sliderMain.BackgroundColor3 = Color3.fromRGB(50,50,50)


				sliderMain.BorderSizePixel = 0


				sliderMain.Position = UDim2.new(0,0,1,0)


				sliderMain.Size = UDim2.new(1,0,0,10)


				sliderMain.ZIndex = 7



				local sliderMainBorder = mainBorder:Clone()


				sliderMainBorder.Parent = sliderMain


				sliderMainBorder.ZIndex = 6



				local sliderMainGradient = tbGradient:Clone()


				sliderMainGradient.Parent = sliderMain



				local sliderMainBar = Instance.new('Frame',sliderMain)


				sliderMainBar.AnchorPoint = Vector2.new(0,0.5)


				sliderMainBar.BackgroundColor3 = cfg.color


				sliderMainBar.BorderSizePixel = 0


				sliderMainBar.Position = UDim2.new(0,0,0.5,0)


				sliderMainBar.Size = UDim2.new(min/max,0,1,0)


				sliderMainBar.ZIndex = 8



				local sliderMainBarGradient = tbGradient:Clone()


				sliderMainBarGradient.Parent = sliderMainBar



				table.insert(library.colorTable,sliderMainBar)



				local globalSliderValue = 0


				local dragging = false



				local function sliding(input)


					local pos = UDim2.new(math.clamp((input.Position.X - sliderMain.AbsolutePosition.X)/sliderMain.AbsoluteSize.X,0,1),0,1,0)


					sliderMainBar.Size = pos



					local sliderPrecise = ((pos.X.Scale*max)/max)*(max-min)+min


					local sliderNonPrecise = math.floor(((pos.X.Scale*max)/max)*(max-min)+min)


					local sliderVal = precise and sliderNonPrecise or sliderPrecise


					sliderVal = tonumber(string.format('%.2f',sliderVal))


					globalSliderValue = sliderVal



					sliderValue.PlaceholderText = tostring(sliderVal)


					callback(globalSliderValue)


				end



				local function setValue(value)


					globalSliderValue = value


					sliderMainBar.Size = UDim2.new(value/max,0,1,0)


					sliderValue.PlaceholderText = value


					callback(value)


				end



				sliderValue.FocusLost:Connect(function()


					if not tonumber(sliderValue.Text) then


						sliderValue.Text = globalSliderValue


					elseif sliderValue.Text == '' or tonumber(sliderValue.Text) <= min then


						sliderValue.Text = min


					elseif sliderValue.Text == '' or tonumber(sliderValue.Text) >= max then


						sliderValue.Text = max


					end



					globalSliderValue = sliderValue.Text


					sliderMainBar.Size = UDim2.new(sliderValue.Text/max,0,1,0)


					sliderValue.PlaceholderText = sliderValue.Text


					callback(tonumber(sliderValue.Text))


					sliderValue.Text = ''


				end)



				slider.InputBegan:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						sliding(input)


						dragging = true


					end


				end)



				slider.InputEnded:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						dragging = false


					end


				end)



				uis.InputChanged:Connect(function(input)


					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then


						sliding(input)


					end


				end)



				if default == nil then


					function sliderInit:setValue(value)


						globalSliderValue = value


						sliderMainBar.Size = UDim2.new(value/max,0,1,0)


						sliderValue.PlaceholderText = value


						callback(value)


					end


				else


					setValue(defaultLocal)


				end



				function sliderInit:getValue(value)


					return globalSliderValue


				end



				return sliderInit


			end



			function sectionInit:createDropdown(name)


				local dropdownInit = {}



				local dropdown = Instance.new('TextButton',sectionContainer)


				dropdown.Name = name..' D'


				dropdown.AutoButtonColor = false


				dropdown.BackgroundColor3 = Color3.fromRGB(25,25,25)


				dropdown.BorderSizePixel = 0


				dropdown.ZIndex = 9


				dropdown.Text = ''



				local dropdownTitle = Instance.new('TextLabel',dropdown)


				dropdownTitle.BackgroundColor3 = Color3.fromRGB(50,50,50)


				dropdownTitle.BorderSizePixel = 0


				dropdownTitle.Position = UDim2.new(0,0,0,20)


				dropdownTitle.ZIndex = 10


				dropdownTitle.Font = Enum.Font.SourceSansSemibold


				dropdownTitle.Text = name


				dropdownTitle.TextColor3 = Color3.fromRGB(200,200,200)


				dropdownTitle.TextSize = 15


				dropdownTitle.TextStrokeTransparency = 0.75


				dropdownTitle.TextXAlignment = Enum.TextXAlignment.Left



				--local dropdownTitleBorder = mainBorder:Clone()


				--dropdownTitleBorder.Parent = dropdownTitle


				--dropdownTitleBorder.ZIndex = 9



				local dropdownContainer = Instance.new('Frame',dropdown)


				dropdownContainer.BackgroundColor3 = Color3.fromRGB(50,50,50)


				dropdownContainer.BorderSizePixel = 0


				dropdownContainer.Size = UDim2.new(1,0,0,20)


				dropdownContainer.ZIndex = 10



				local dropdownContainerBorder = mainBorder:Clone()


				dropdownContainerBorder.Parent = dropdownContainer


				dropdownContainerBorder.ZIndex = 9



				local dropdownContainerGradient = tbGradient:Clone()


				dropdownContainerGradient.Parent = dropdownContainer



				dropdownTitle.Size = UDim2.new(1,0,0,dropdownTitle.TextBounds.Y+5)


				dropdownContainer.Position = UDim2.new(0,0,0,dropdownTitle.TextBounds.Y+5)


				dropdown.Size = UDim2.new(1,-10,0,dropdownTitle.TextBounds.Y+25)


				dropdownContainer.Position = UDim2.new(0,0,0,dropdownTitle.TextBounds.Y+5)



				local dropdownContainerHolder = Instance.new('Frame',dropdownContainer)


				dropdownContainerHolder.AnchorPoint = Vector2.new(0.5,0)


				dropdownContainerHolder.BackgroundColor3 = Color3.fromRGB(50,50,50)


				dropdownContainerHolder.BorderSizePixel = 0


				dropdownContainerHolder.Position = UDim2.new(0.5,0,0,25)


				dropdownContainerHolder.Size = UDim2.new(1,0,0,0)


				dropdownContainerHolder.ZIndex = 10


				dropdownContainerHolder.Visible = false



				--local dropdownContainerHolderBorder = mainBorder:Clone()


				--dropdownContainerHolderBorder.Parent = dropdownContainerHolder


				--dropdownContainerHolderBorder.ZIndex = 9



				local dropdownContainerHolderGradient = tbGradient:Clone()


				dropdownContainerHolderGradient.Parent = dropdownContainerHolder



				local dropdownContainerValue = Instance.new('TextLabel',dropdownContainer)


				dropdownContainerValue.AnchorPoint = Vector2.new(0.5,0)


				dropdownContainerValue.BackgroundTransparency = 1


				dropdownContainerValue.Position = UDim2.new(0.5,0,0,0)


				dropdownContainerValue.Size = UDim2.new(1,-10,0,20)


				dropdownContainerValue.ZIndex = 11


				dropdownContainerValue.Font = Enum.Font.SourceSansSemibold


				dropdownContainerValue.Text = '...'


				dropdownContainerValue.TextColor3 = Color3.fromRGB(200,200,200)


				dropdownContainerValue.TextSize = 15


				dropdownContainerValue.TextStrokeTransparency = 0.75


				dropdownContainerValue.TextXAlignment = Enum.TextXAlignment.Left



				local dropdownContainerHolderContainer = Instance.new('Frame',dropdownContainerHolder)


				dropdownContainerHolderContainer.BackgroundTransparency = 1


				dropdownContainerHolderContainer.Size = UDim2.new(1,0,1,0)


				dropdownContainerHolderContainer.ZIndex = 10



				local dropdownContainerHolderContainerList = Instance.new('UIListLayout',dropdownContainerHolderContainer)


				dropdownContainerHolderContainerList.FillDirection = Enum.FillDirection.Vertical


				dropdownContainerHolderContainerList.HorizontalAlignment = Enum.HorizontalAlignment.Center



				local dropdownContainerHolderBorder


				dropdownContainerHolderBorder = mainBorder:Clone()


				dropdownContainerHolderBorder.ZIndex = 9


				


				local dropdownToggle = false


				dropdown.MouseButton1Click:Connect(function()


					dropdownToggle = not dropdownToggle


					if dropdownToggle then


						dropdown.Size = UDim2.new(1,-10,0,dropdownContainerHolderContainerList.AbsoluteContentSize.Y+dropdownTitle.TextBounds.Y+30)


						dropdownContainerHolder.Visible = true



						dropdownContainerHolderBorder.Parent = dropdownContainerHolder


					else


						dropdown.Size = UDim2.new(1,-10,0,dropdownTitle.TextBounds.Y+25)


						dropdownContainerHolder.Visible = false


					end


				end)



				function dropdownInit:addOption(name,callback)


					local optionInit = {}



					local option = Instance.new('TextButton',dropdownContainerHolderContainer)


					option.Name = name..' O'


					option.BackgroundColor3 = cfg.color


					option.BackgroundTransparency = 1


					option.ZIndex = 12


					option.Text = ''



					local optionGradient = tbGradient:Clone()


					optionGradient.Parent = option



					local optionTitle = Instance.new('TextLabel',option)


					optionTitle.AnchorPoint = Vector2.new(0.5,0)


					optionTitle.BackgroundTransparency = 1


					optionTitle.Position = UDim2.new(0.5,0,0,0)


					optionTitle.Size = UDim2.new(1,-10,0,20)


					optionTitle.ZIndex = 12


					optionTitle.Font = Enum.Font.SourceSansSemibold


					optionTitle.Text = name


					optionTitle.TextColor3 = Color3.fromRGB(200,200,200)


					optionTitle.TextSize = 15


					optionTitle.TextStrokeTransparency = 0.75


					optionTitle.TextXAlignment = Enum.TextXAlignment.Left



					option.Size = UDim2.new(1,0,0,optionTitle.TextBounds.Y+5)


					dropdownContainerHolder.Size = UDim2.new(1,0,0,dropdownContainerHolderContainerList.AbsoluteContentSize.Y)



					table.insert(library.colorTable,option)



					option.MouseButton1Down:Connect(function()


						option.BackgroundTransparency = 0


					end)



					option.MouseButton1Up:Connect(function()


						option.BackgroundTransparency = 1


					end)



					option.MouseLeave:Connect(function()


						option.BackgroundTransparency = 1


					end)



					option.MouseButton1Click:Connect(function()


						dropdownContainerValue.Text = name


						callback(name)


					end)



					function optionInit:setOption()


						dropdownContainerValue.Text = name


						callback(name)


					end



					function optionInit:Remove()


						option:Destroy()


						dropdownContainerHolder.Size = UDim2.new(1,0,0,dropdownContainerHolderContainerList.AbsoluteContentSize.Y)


						dropdown.Size = UDim2.new(1,-10,0,dropdownContainerHolderContainerList.AbsoluteContentSize.Y+dropdownTitle.TextBounds.Y+30)


					end



					return optionInit


				end



				function dropdownInit:clearOptions()


					for _,v in pairs(dropdownContainerHolderContainer:GetChildren()) do


						if v:IsA('TextButton') then


							v:Destroy()


						end


					end



					dropdownContainerHolder.Size = UDim2.new(1,-10,0,dropdownContainerHolderContainerList.AbsoluteContentSize.Y)


					dropdown.Size = UDim2.new(1,-10,0,dropdownContainerHolderContainerList.AbsoluteContentSize.Y+dropdownTitle.TextBounds.Y+30)


				end



				function dropdownInit:getOption()


					return dropdownContainerValue.Text


				end



				return dropdownInit


			end



			function sectionInit:createColorpicker(name,callback)


				local colorpickerInit = {}



				local colorpicker = Instance.new('TextButton',sectionContainer)


				colorpicker.Name = name..' CP'


				colorpicker.AutoButtonColor = false


				colorpicker.BackgroundTransparency = 1


				colorpicker.ZIndex = 10


				colorpicker.Text = ''



				local colorpickerTitle = Instance.new('TextLabel',colorpicker)


				colorpickerTitle.AnchorPoint = Vector2.new(0,0.5)


				colorpickerTitle.BackgroundTransparency = 1


				colorpickerTitle.Position = UDim2.new(0,0,0.5,0)


				colorpickerTitle.ZIndex = 10


				colorpickerTitle.Font = Enum.Font.SourceSansSemibold


				colorpickerTitle.Text = name


				colorpickerTitle.TextColor3 = Color3.fromRGB(200,200,200)


				colorpickerTitle.TextSize = 15


				colorpickerTitle.TextStrokeTransparency = 0.75


				colorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left



				local colorpickerMain = Instance.new('Frame',colorpicker)


				colorpickerMain.AnchorPoint = Vector2.new(1,0.5)


				colorpickerMain.BackgroundColor3 = Color3.fromRGB(255,0,0)


				colorpickerMain.BorderSizePixel = 0


				colorpickerMain.Position = UDim2.new(1,0,0.5,0)


				colorpickerMain.Size = UDim2.new(0,20,0,10)


				colorpickerMain.ZIndex = 10



				local colorpickerMainBorder = mainBorder:Clone()


				colorpickerMainBorder.Parent = colorpickerMain


				colorpickerMainBorder.ZIndex = 9



				local colorpickerMainGradient = tbGradient:Clone()


				colorpickerMainGradient.Parent = colorpickerMain



				local pallette = Instance.new('Frame',colorpicker)


				pallette.Name = name..' P'


				pallette.AnchorPoint = Vector2.new(1,0)


				pallette.BackgroundColor3 = Color3.fromRGB(50,50,50)


				pallette.BorderSizePixel = 0


				pallette.Position = UDim2.new(1,0,1,0)


				pallette.Size = UDim2.new(0,150,0,230)


				pallette.Visible = false


				pallette.ZIndex = 10



				local palletteBorder = mainBorder:Clone()


				palletteBorder.Parent = pallette


				palletteBorder.ZIndex = 9



				local palletteGradient = tbGradient:Clone()


				palletteGradient.Parent = pallette



				local palletteMain = Instance.new('ImageButton',pallette)


				palletteMain.AutoButtonColor = false


				palletteMain.BackgroundColor3 = Color3.fromRGB(255,0,0)


				palletteMain.BorderSizePixel = 0


				palletteMain.Position = UDim2.new(0,5,0,5)


				palletteMain.Size = UDim2.new(1,-10,0,180)


				palletteMain.ZIndex = 11


				palletteMain.HoverImage = ''


				palletteMain.Image = 'rbxassetid://4155801252'


				palletteMain.ImageColor3 = Color3.fromRGB(255,255,255)


				palletteMain.ScaleType = Enum.ScaleType.Stretch



				local palletteMainBorder = mainBorder:Clone()


				palletteMainBorder.Parent = palletteMain


				palletteMainBorder.ZIndex = 10



				local dot = Instance.new('Frame',palletteMain)


				dot.AnchorPoint = Vector2.new(0.5,0.5)


				dot.BorderSizePixel = 2


				dot.Position = UDim2.new(1,0,0,0)


				dot.Rotation = 45


				dot.Size = UDim2.new(0,3,0,3)


				dot.ZIndex = 12



				local palletteColorSlider = Instance.new('TextButton',pallette)


				palletteColorSlider.AutoButtonColor = false


				palletteColorSlider.AnchorPoint = Vector2.new(1,0)


				palletteColorSlider.BorderSizePixel = 0


				palletteColorSlider.Position = UDim2.new(1,-5,0,190)


				palletteColorSlider.Size = UDim2.new(1,-10,0,10)


				palletteColorSlider.ZIndex = 11


				palletteColorSlider.Text = ''


				


				local palletteColorSliderGradient = Instance.new('UIGradient',palletteColorSlider)


				palletteColorSliderGradient.Color = ColorSequence.new{


					ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),


					ColorSequenceKeypoint.new(0.167,Color3.fromRGB(255,0,255)),


					ColorSequenceKeypoint.new(0.334,Color3.fromRGB(0,0,255)),


					ColorSequenceKeypoint.new(0.501,Color3.fromRGB(0,255,255)),


					ColorSequenceKeypoint.new(0.668,Color3.fromRGB(0,255,0)),


					ColorSequenceKeypoint.new(0.835,Color3.fromRGB(255,255,0)),


					ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))


				}


				


				local palletteColorSliderBorder = mainBorder:Clone()


				palletteColorSliderBorder.Parent = palletteColorSlider


				palletteColorSliderBorder.ZIndex = 10



				local palletteColorInput = Instance.new('Frame',pallette)


				palletteColorInput.AnchorPoint = Vector2.new(0.5,0)


				palletteColorInput.BackgroundColor3 = Color3.fromRGB(50,50,50)


				palletteColorInput.BorderSizePixel = 0


				palletteColorInput.Position = UDim2.new(0.5,0,0,205)


				palletteColorInput.Size = UDim2.new(1,-10,0,20)


				palletteColorInput.ZIndex = 11



				local palletteColorInputBorder = mainBorder:Clone()


				palletteColorInputBorder.Parent = palletteColorInput


				palletteColorInputBorder.ZIndex = 10



				local palletteColorInputGradient = tbGradient:Clone()


				palletteColorInputGradient.Parent = palletteColorInput



				local palletteColorInputBox = Instance.new('TextBox',palletteColorInput)


				palletteColorInputBox.BackgroundTransparency = 1


				palletteColorInputBox.Size = UDim2.new(1,0,1,0)


				palletteColorInputBox.ZIndex = 11


				palletteColorInputBox.Font = Enum.Font.SourceSansSemibold


				palletteColorInputBox.PlaceholderColor3 = Color3.fromRGB(200,200,200)


				palletteColorInputBox.PlaceholderText = '255, 0, 0'


				palletteColorInputBox.Text = ''


				palletteColorInputBox.TextColor3 = Color3.fromRGB(200,200,200)


				palletteColorInputBox.TextSize = 15


				palletteColorInputBox.TextStrokeTransparency = 0.75



				colorpicker.Size = UDim2.new(1,-10,0,colorpickerTitle.TextBounds.Y+5)


				


				local colorTable = {


					h=1,


					s=0,


					v=0


				}



				local colorRender = nil


				local hueRender = nil


				local colorpickerToggle = false



				local function updateColor()


					colorpickerMain.BackgroundColor3 = Color3.fromHSV(colorTable.h,colorTable.s,colorTable.v)


					palletteMain.BackgroundColor3 = Color3.fromHSV(colorTable.h,1,1)


					palletteColorInputBox.PlaceholderText = tostring(math.round(colorpickerMain.BackgroundColor3.R*255)..', '..math.round(colorpickerMain.BackgroundColor3.G*255)..', '..math.round(colorpickerMain.BackgroundColor3.B*255))


					callback(colorpickerMain.BackgroundColor3)


				end



				colorpicker.MouseButton1Click:Connect(function()


					colorpickerToggle = not colorpickerToggle


					if colorpickerToggle then


						pallette.Visible = true


					else


						pallette.Visible = false


					end


				end)



				palletteMain.InputBegan:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if colorRender then


							colorRender:Disconnect()


						end



						colorRender = rs.RenderStepped:Connect(function()


							local mouse = uis:GetMouseLocation()


							local cX = math.clamp(mouse.X-palletteMain.AbsolutePosition.X,0,palletteMain.AbsoluteSize.X)/palletteMain.AbsoluteSize.X


							local cY = math.clamp((mouse.Y-37)-palletteMain.AbsolutePosition.Y,0,palletteMain.AbsoluteSize.Y)/palletteMain.AbsoluteSize.Y


							dot.Position = UDim2.new(cX,0,cY,0)


							colorTable.s = cX


							colorTable.v = 1 - cY


							updateColor()


						end)


					end


				end)



				palletteMain.InputEnded:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if colorRender then


							colorRender:Disconnect()


						end


					end


				end)



				palletteColorSlider.InputBegan:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if hueRender then


							hueRender:Disconnect()


						end



						hueRender = rs.RenderStepped:Connect(function()


							local mouse = uis:GetMouseLocation()


							local hX = math.clamp(mouse.X-palletteColorSlider.AbsolutePosition.X,0,palletteColorSlider.AbsoluteSize.X)/palletteColorSlider.AbsoluteSize.X


							colorTable.h = 1 - hX


							updateColor()


						end)


					end


				end)



				palletteColorSlider.InputEnded:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if hueRender then


							hueRender:Disconnect()


						end


					end


				end)



				function colorpickerInit:updateColor(color)


					local h,s,v = color:ToHSV()


					colorpickerMain.BackgroundColor3 = Color3.fromHSV(h,s,v)


					palletteMain.BackgroundColor3 = Color3.fromHSV(h,1,1)


					palletteColorInputBox.PlaceholderText = tostring(math.round(colorpickerMain.BackgroundColor3.R*255)..', '..math.round(colorpickerMain.BackgroundColor3.G*255)..', '..math.round(colorpickerMain.BackgroundColor3.B*255))


					colorTable = {


						h=h,


						s=s,


						v=v


					}


					callback(color)


				end



				palletteColorInputBox.FocusLost:Connect(function(enter)


					if enter then


						local colorString = string.split(string.gsub(palletteColorInputBox.Text,' ',''),',')


						colorpickerInit:updateColor(Color3.fromRGB(colorString[1],colorString[2],colorString[3]))


						palletteColorInputBox.Text = ''


					end


				end)



				return colorpickerInit


			end


			return sectionInit


		end


		return tInit


	end


	return windowInit


end



return library
