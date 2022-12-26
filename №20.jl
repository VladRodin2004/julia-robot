using HorizonSideRobots

robot=Robot(animate=true,"20.sit")
side=3


function go_next!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
    else
        move!(robot, right(side))
        go_next!(robot, side)
        move!(robot, left(side))
    end
end

right(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)
left(side::HorizonSide) = HorizonSide((Int(side) +3)% 4)

go_next!(robot,HorizonSide(side))