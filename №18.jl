using HorizonSideRobots

robot=Robot(animate=true,"18.sit")
side=2


function dvizhenie_recursive!(robot::Robot, side::HorizonSide)
    if !isborder(robot, side)
        move!(robot, side)
        dvizhenie_recursive!(robot, side)
    end
end

dvizhenie_recursive!(robot,HorizonSide(side))

