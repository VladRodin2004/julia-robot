using HorizonSideRobots

robot=Robot(animate=true,"25.sit")

side=3

function putmarker_rec!(robot::Robot, side::HorizonSide, check::Int64)
    if !isborder(robot, side)
        if check % 2 == 0
            putmarker!(robot)
        end
        move!(robot, side)
        putmarker_rec!(robot, side, check + 1)
    end
end


putmarker_rec!(robot,HorizonSide(side),0)