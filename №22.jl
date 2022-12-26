using HorizonSideRobots

robot=Robot(animate=true,"22.sit")
side=3

function symmetrical!(robot, side)
    if isborder(robot, side)
        while !isborder(robot, inverse(side))
            move!(robot, inverse(side))
        end
    else
        move!(robot, side)
        symmetrical!(robot, side)
        move!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2) %4)

symmetrical!(robot,HorizonSide(side))