using HorizonSideRobots

robot=Robot(animate=true,"24.sit")
side=3


function polovina!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        polovina_without_moveback!(robot, side)
        move!(robot, inverse(side))
    end
end

function polovina_without_moveback!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        polovina!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)

polovina!(robot,HorizonSide(side))