using HorizonSideRobots

robot=Robot(animate=true,"19.sit")
side=readline()
side=parse(Int64,side)

function dvizhenie_recursive_putmarker!(robot::Robot, side::HorizonSide)
    if isborder(robot, side)
        putmarker!(robot)
    else
        move!(robot, side)
        dvizhenie_recursive_putmarker!(robot, side)
        move!(robot, inverse(side))
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)

dvizhenie_recursive_putmarker!(robot,HorizonSide(side))