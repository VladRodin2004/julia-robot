using HorizonSideRobots

robot=Robot(animate=true,"12.sit")

function countpartitions(robot)
    side = Ost
    count = 0
    countcheck = 0
    countblank = 0
    counttotal = 0
    while !isborder(robot, side)
        move!(robot, side)
        if isborder(robot, Nord)
            countblank = 0
            count += 1;
            countcheck += 1
        elseif !isborder(robot, Nord) 
            countblank += 1
            if (countblank <= 1) 
                count += 1;
                countcheck += 1
            else
                if (count == 0 || countcheck == 0)
                    counttotal += 0
                else 
                    counttotal += count / countcheck
                    count = 0
                    countcheck = 0
                end
            end
        end
        if isborder(robot, side) && !isborder(robot, Nord)
            if (countblank <= 1)
                if (count == 0 || countcheck == 0)
                    counttotal += 0
                else 
                    counttotal += count / countcheck
                    count = 0
                    countcheck = 0
                end
            end
            move!(robot, Nord)
            side = inverse(side)
            count = 0
            countcheck = 0
        end
    end
    print(counttotal-1)
    gotostart1!(robot)
    gotostart2!(robot)
end

gotostart1!(robot::Robot) =
    while isborder(robot,West)==false
        move!(robot,West)
    end
gotostart2!(robot::Robot) =
    while isborder(robot,Sud)==false
        move!(robot,Sud)
    end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)

countpartitions(robot)
            