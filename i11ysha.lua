local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local p=Players.LocalPlayer

local g=Instance.new("ScreenGui",game.CoreGui)

local b=Instance.new("TextButton",g)
b.Size=UDim2.new(0,20,0,20)
b.Position=UDim2.new(0,10,0,10)
b.Text="F"
b.TextScaled=true

local b2=Instance.new("TextButton",g)
b2.Size=UDim2.new(0,20,0,20)
b2.Position=UDim2.new(0,35,0,10)
b2.Text="A"
b2.TextScaled=true

local t=false
local a=false
local lastPos

local function fling()
 local m=.1
 while t do
  RunService.Heartbeat:Wait()
  local h=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
  if h then

   if lastPos and (h.Position-lastPos).Magnitude>10 then
    lastPos=h.Position
    continue
   end
   lastPos=h.Position

   local v=h.Velocity
   h.Velocity=v*1e4+Vector3.new(0,1e4,0)
   RunService.RenderStepped:Wait()
   h.Velocity=v
   RunService.Stepped:Wait()
   h.Velocity=v+Vector3.new(0,m,0)
   m=-m
  end
 end
end

RunService.Heartbeat:Connect(function()
 if not a then return end
 local c=p.Character
 local h=c and c:FindFirstChild("HumanoidRootPart")
 if h then
  if h.Velocity.Magnitude>100 then
   h.Velocity=Vector3.zero
   h.RotVelocity=Vector3.zero
  end
 end
end)

b.MouseButton1Click:Connect(function()
 t=not t
 b.Text=t and "ON" or "F"
 if t then task.spawn(fling) end
end)

b2.MouseButton1Click:Connect(function()
 a=not a
 b2.Text=a and "ON" or "A"
end)
