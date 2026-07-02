local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local p=Players.LocalPlayer

local g=Instance.new("ScreenGui",game.CoreGui)
local b=Instance.new("TextButton",g)
b.Size=UDim2.new(0,30,0,30)
b.Position=UDim2.new(0,10,0,10)
b.Text="OFF"
b.TextScaled=true

local t=false
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

b.MouseButton1Click:Connect(function()
 t=not t
 b.Text=t and "ON" or "OFF"
 if t then task.spawn(fling) end
end)
